class LinksController < InheritedResources::Base
def index
	@links = Link.all
end



  private

    def link_params
      params.require(:link).permit(:link_cat, :image, :link_url)
    end
end

