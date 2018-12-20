class Api::V1::SitesController < ApplicationController
  before_action :find_site, only: [:update]
  
  def index
    @sites = Site.all
    render json: @sites
  end

  def create
    @site = Site.create(site_params)
    if @site.valid?
      render json: @site, status: :accepted
    else
      render json: { errors: @site.errors.full_messages }
    end
  end

  def update
    @site.update(site_params)
    if @site.save
      render json: @site, status: :accepted
    else
      render json: { errors: @site.errors.full_messages }
    end
  end

  private

  def find_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :url, :category_id)
  end

end
