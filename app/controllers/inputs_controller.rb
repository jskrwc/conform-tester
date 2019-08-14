class InputsController < ApplicationController

  def index
    @inputs = Input.all
  end

  def show
    @input = Input.find(params[:id])
  end

  def new
    @input = Input.new
  end

  def create
    @input = Input.new(input_params)
    if @input.save
      # flash[:notice] = "Your Input has been saved"
      # redirect_to inputs_index
      # redirect_to index_url
      redirect_to @input
    else
      flash.now[:alert] = "There was an error creating your input -- Please try again"
      render :new
    end
  end

  def edit
    @input = Input.find(params[:id])
  end

  def update
    @input = Input.find(params[:id])
    if @input.update_attributes(input_params)
      # flash[:notice] = "Your Input has been saved"
      redirect_to input_path
    else
      # flash.now[:alert] = "There was an error creating your input -- Please try again"
      render :new
    end
  end

  def destroy
    @input = Input.find(params[:id])
    @input.destroy
    redirect_to input_path
  end


  private
  def input_params
    params.require(:input).permit(:field1)
  end

end
