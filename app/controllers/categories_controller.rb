class CategoriesController < ApplicationController
    def show
        @category = Category.all
    end
end
