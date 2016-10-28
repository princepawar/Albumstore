class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def edit
  end

  def create
    @owner = Owner.new(owner_params)
      if @owner.save
        flash[:notice] = "owner successfully created"
       redirect_to 'index'
      end
  end

  def update
  end

  def destroy
  end

  private

  def owner_params
    params.require(:owner).permit(:owner_name)
  end
end
