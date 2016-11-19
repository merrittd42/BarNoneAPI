class AdminController < ActionController::Base
  def index
    safe do
      @bars = Bar.all
      render :index
    end
  end

  def view
    safe do
      @bar = Bar.find(bar_id)
      render :view
    end
  end

  def delete
    safe do
      Bar.find_by(bar_id).destroy
      redirect_to controller: :admin, action: :index
    end
  end

  def update
    safe do
      @bar = Bar.find_by bar_id
      render :update
    end
  end

  def save
    safe do
      bar = Bar.find_by bar_id
      bar.attributes = bar_item
      bar.save
      redirect_to controller: :admin, action: :index
    end
  end

  def add
    safe do
      print params
      Bar.create bar_item
      redirect_to controller: :admin, action: :index
    end
  end

  def new
    render :new
  end

  private

  def safe
    begin
      if block_given?
        yield
      end
    rescue Exception => e
      print "ERROR: "
      puts e
      redirect_to controller: :admin, action: :index
    end
  end

  def bar_item
    { name: params["name"],
      latitude: params["latitude"].to_f,
      longitude: params["longitude"].to_f,
      description: params["description"],
      rating: params["rating"].to_i,
      loudness: params["loudness"].to_i,
      crowdedness: params["crowdedness"].to_i,
      bar_category: params["bar_category"],
      address: params["address"],
      person_count: params["person_count"].to_i,
      rating_count: params["rating_count"].to_i,
      loudness_count: params["loudness_count"].to_i,
      crowdedness_count: params["crowdedness_count"].to_i }
  end

  def bar_id
    params.require(:id)
  end


end
