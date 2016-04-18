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
      Link.update(params[:id], link_params)
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
