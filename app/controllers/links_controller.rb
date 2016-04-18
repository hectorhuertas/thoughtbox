class LinksController < ApplicationController
  def index
    @link  = Link.new
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash[:danger] = 'Invalid Link'
      redirect_to links_path
    end
  end

  def update
    if params[:read]
      Link.update(params[:id], read: params[:read] ==='true' ? true : false)
      redirect_to links_path
    else
      @link = Link.find(params[:id])
      if @link.update(link_params)
        Link.update(params[:id], link_params)
        redirect_to links_path
      else
        flash.now[:danger] = 'Invalid data'
        render :edit
      end
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def toggleStatus
    @link = Link.find(params[:link_id])
    @link.update(read: !@link.read)
    render json: {msg: 'ok'}
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
