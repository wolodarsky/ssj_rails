class IndexController < ApplicationController
  def index
    manifest_id = params[:manifest_id]
    if manifest_id.blank?
      manifest_id = REDIS.get("ssj-ember:current")
    end
    html = REDIS.get(manifest_id)
    render :text => html
  end
end
