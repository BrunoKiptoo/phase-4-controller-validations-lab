class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
   author = Author.create(author_params)
   if author.valid?
    render json: author, status: :created
   else
      render_not_found_response
   end
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def render_not_found_response
    render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
  end
  
end
