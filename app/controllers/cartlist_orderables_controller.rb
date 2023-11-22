class CartlistOrderablesController < ApplicationController

    def index
        @cartlist = Cartlist.all
        @cartorderable = CartlistOrderable.all
    end
end
