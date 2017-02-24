class IdeasController < ApplicationController



  def index
    @current_user = User.find(session[:user_id])
    # render json: session[:user_id]
    @ideas = Idea.all
    # render json: @ideas
    # render json: Idea.first.user.alias
    # if !session[:people]
    #   session[:people]=[]
    # end
    # @people = session[:people]
    # render json: @ideas
  end

  def show

    # if !session[:people]
    #   session[:people]=[]
    # end
    # @people = session[:people]
    # render json: session[:people]
    # render json:@people
  end

  def new
    # @people = session[:people]
    # fail
    @current_user = User.find(session[:user_id])
    @idea = Idea.find(params[:id])
    @people = @idea.users


    # render json:@people
  end

  def create
    @idea = User.find(session[:user_id]).ideas.create(content: params[:idea][:content])
    # redirect_to "/users/#{session[:user_id]}"
    # render json: session[:user_id]
    # fail
    redirect_to '/bright_ideas'
  end

  def destroy


    if Idea.find(params[:id]).user == User.find(session[:user_id])
      Idea.find(params[:id]).destroy
    else
      flash[:errors] = ["Can not delete."]
    end
    redirect_to '/bright_ideas'
  end



  def people
    # render json: session[:user_id]
    user = User.find(session[:user_id])
    # render json: user
    session[:people].push(user)
    # render json: session[:people]
    redirect_to "/bright_ideas/#{params[:id]}"

    # fail
  end

  def like
    # fail

    Like.create(user: User.find(session[:user_id]), idea: Idea.find(params[:id]))
    redirect_to '/bright_ideas'
    # user = User.find(session[:user_id])
    # session[:people].push(user)
  end





  private
		def song_params
			params.require(:song).permit(:content)
		end
end
