class NikkisController < InheritedResources::Base

  private

    def nikki_params
      params.require(:nikki).permit(:value, :datetime)
    end
end

