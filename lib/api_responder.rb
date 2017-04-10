class ApiResponder < ActionController::Responder
  def to_json
    if get?
      render :json => resource, :status => :ok
    elsif has_errors?
      render :json => resource.errors, :status => :unprocessable_entity
    elsif post?
      render :json => resource, :status => :created
    elsif put?
      render :json => resource, :status => :ok
    elsif delete?
      head :no_content
    else
      head :ok
    end
  end
end
