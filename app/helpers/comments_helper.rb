module CommentsHelper

  def votable?(comment)
    votes = Vote.where(["user_id = ? and comment_id = ?", current_user.id, comment.id])
    if votes.any?
      votable = false
    else
      votable = true
    end
    votable
  end

end
