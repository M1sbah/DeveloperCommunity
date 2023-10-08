class Connection < ApplicationRecord
  belongs_to :user

  belongs_to :requested, foreign_key: :connected_user_id, class_name: "User"
  belongs_to :received, foreign_key: :user_id, class_name: "User"


  validates :connected_user_id, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending accepted rejected deleted)}




  def status_btn
    case status
    when "accepted"
      "btn btn-success"
    when "rejected"
      "btn btn-danger"
    else
      "btn btn-primary"
    end
  end

end