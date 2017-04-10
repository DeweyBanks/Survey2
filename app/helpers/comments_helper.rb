module CommentsHelper

  def voteable?(comment)
    votes = Vote.where(["user_id = ? and comment_id = ?", current_user.id, comment.id])
    if votes.any?
      voteable = false
    else
      voteable = true
    end
    voteable
  end

end
