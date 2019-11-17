class PagesController < InheritedResources::Base

  http_basic_authenticate_with name: "admin", password: "password"

  def permalink
    @page = Page.find_by_permalink(params[:permalink])
    if @page
      render :show
    else
      redirect_to root_path
    end
  end

  private
    def page_params
      params.require(:page).permit(:title, :content, :permalink)
    end

end
