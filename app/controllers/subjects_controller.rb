class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :leasable, :not_leasable, :watching]
  before_action :authenticate_user!, except: [:index, :show]


def watching

Watch.create(user_id: current_user.id, subject_id: @subject.id)

redirect_to subject_path(@subject), notice: "Předmět byl přidán do sledovaných"

end



def leasable
    @subject.leasable = true
    @subject.save

    redirect_to subjects_path

end

def not_leasable
    @subject.leasable = false
    @subject.save

    redirect_to subjects_path

end


  # GET /subjects
  # GET /subjects.json
  def index
    if user_signed_in?
      @subjects = current_user.subjects.search(params[:search])
    else
      @subjects = Subject.search(params[:search]).where(is_public2:true)
    end    
# dostane se na to  jiny uzivatel !!, když změním ale tak to nepujde vyhledavat vubec 

  end



  # GET /subjects/1
  # GET /subjects/1.json
  def show

    @contracts=@subject.contracts
  
    @subjects = Subject.where(is_public2: true)

  end

  # GET /subjects/new
  def new
    @subject = Subject.new

    @types = (["Movitost","Nemovitost", "Ostatní"])
    
    5.times do 
      @subject.images.build

    end

  end

  # GET /subjects/1/edit
  def edit

    5.times do 
      @subject.images.build
    end
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
@subject.user_id=current_user.id
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :type, :description, :is_public2, :image, :remote_image_url, images_attributes: [:image, :id])
    end
end