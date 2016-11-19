class AdminController < ActionController::Base
  def index
    @bars = Bar.all
    render :index
  end

  def view
    @bar = Bar.find(bar_id)
    render :view
  end

  def delete
    Bar.find_by(bar_id).destroy
    redirect_to controller: :admin, action: :index
  end

  def update
    bar = Bar.find_by bar_id
    bar.update = params
    redirect_to controller: :admin, action: :index
  end

  def add
    Bar.create(params)
    redirect_to controller: :admin, action: :index
  end

  def new
    render :new
  end

  private

  def bar_id
    params.require(:id)
  end


end
