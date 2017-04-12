class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :vote, :upvote, :downvote, :update, :destroy]


  def new
    @comment = Comment.new
  end


  def edit
  end

  def vote

  end

  def upvote
    Vote.create(user_id: current_user.id, comment_id: @comment.id, direction: "up")
    @survey = @comment.survey
    @comment.up_vote += 1
    @comment.save
    respond_to do |format|
      format.js { render "vote", :locals => {:id => params[:id]} }
    end
  end

   def downvote
    Vote.create(user_id: current_user.id, comment_id: @comment.id, direction: "down")
    @survey = @comment.survey
    @comment.down_vote += 1
    @comment.save
    respond_to do |format|
      format.js { render "vote", :locals => {:id => params[:id]} }
    end
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @comment = @survey.comments.create(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to results_path(id: @survey.id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to results_path(id: @comment.survey_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    survey_id = @comment.survey_id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to results_path(id: survey_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(
        :body,
        :user_id,
        :survey
        )
    end
end
