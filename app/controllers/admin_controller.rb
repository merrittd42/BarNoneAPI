class AdminController < ApplicationController
  def index
    render json: Bar.all
  end

  def view
    render json: Bar.find(bar_id)
  end

  def delete
    render json: Bar.find_by(bar_id).destroy
  end

  def update
  end

  def add
  end

  private

  def bar_id
    params.require(:id)
  end
end
