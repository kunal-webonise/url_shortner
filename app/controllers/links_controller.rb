class LinksController < ApplicationController

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
    def show
      if params[:slug]
        @link = Link.find_by(slug: params[:slug])
        if redirect_to @link.url
          @link.hits += 1
          @link.save
        end
      else
        @link = Link.find(params[:id])
      end
    end
  end

  # GET /links/new
  def new
    @link = Link.new
    @links = Link.all
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
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :slug, :hits)
    end
end
