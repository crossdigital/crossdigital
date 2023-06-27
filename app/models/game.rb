class Game < ApplicationRecord
  STATES = [
    WAITING_FOR_PARTICIPANTS = 'waiting_for_participants',
    PARTICIPANTS_FOUND = 'participants_found',
    ACTIVE = 'active',
    FINISHED = 'finished'
  ]

  has_many :cards
  has_many :participants, -> { order team: :asc, role: :desc }

  before_save :set_state
  before_create :create_cards

  def create_cards
    nil
  end

  def start
    return unless state == PARTICIPANTS_FOUND
    self.state = ACTIVE
    save
  end

  def set_state
    return if state == FINISHED
    if have_spymasters? && have_operatives?
      return if state == ACTIVE
      self.state = PARTICIPANTS_FOUND
    else
      self.state = WAITING_FOR_PARTICIPANTS
    end
  end

  def have_spymasters?
    participants.red_spymasters.present? && participants.blue_spymasters.present?
  end

  def have_operatives?
    participants.red_operatives.present? && participants.blue_operatives.present?
  end
end
