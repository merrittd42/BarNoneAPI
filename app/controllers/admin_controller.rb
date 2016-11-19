class AdminController < ActionController::Base
  def index
    @bars = Bar.all
    render :index
  end

  def view
    @bar = Bar.find(bar_id)
    if @bar != nil
      render :view
    else
      redirect_to :index
    end
  end

  def delete
    render json: Bar.find_by(bar_id).destroy
  end

  def update
  end

  def add
    print params
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
