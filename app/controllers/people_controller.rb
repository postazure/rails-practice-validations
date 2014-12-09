class PeopleController < ApplicationController

  def index
    @people = Person.order(:id)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path, notice: "Person saved successfully"
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to people_path, notice: "Person updated successfully"
    else
      render :edit
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :date_of_birth)
  end

end
