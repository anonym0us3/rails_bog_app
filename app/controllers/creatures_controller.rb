class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all

    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    creature_params = params.require(:creature).permit(:name, :description)

    taco = Creature.new(creature_params)
    creature
    if taco.save
      redirect_to creature_path(taco.id)
    end
  end

  def show
    creature_id = params[:id]

    @creature = Creature.find_by_id(creature_id)

    render :show
  end

  def edit
    creature_id = params[:id]

    @creature = Creature.find_by_id(creature_id)

    render :edit
  end

  def update
    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature_params = params.require(:creature).permit(:name, :description)

    creature.update_attributes(creature_params)

    redirect_to creature_path(creature)
  end

  def destroy
    creature_id = params[:id]

    creature = Creature.find_by_id(creature_id)

    creature.destroy

    redirect_to creatures_path
  end

end