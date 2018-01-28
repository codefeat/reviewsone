class ReviewStatusesController < InheritedResources::Base

  private

    def review_status_params
      params.require(:review_status).permit(:user_id, :feedback_id, :feedback_status, :note)
    end
end

