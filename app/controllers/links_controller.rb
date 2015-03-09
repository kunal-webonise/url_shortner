class LinksController < ApplicationController

  # GET /links
  # GET /links.json
  def index
    @links = Link.top_links.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find_by(slug: params[:slug])
    if redirect_to @link.url
      @link.hits += 1
      @link.save
    end
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.js
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :slug, :hits)
    end
end
