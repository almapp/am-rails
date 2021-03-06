class CoursesController < ApplicationController
  before_action :set_faculty, only: [:index, :new, :create]
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = @faculty.courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = @faculty.courses.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    @course.faculty = @faculty

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_path(@course), notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    redirection = faculty_courses_path(@course.faculty)
    @course.destroy

    respond_to do |format|
      format.html { redirect_to redirection, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_faculty
      @faculty = Faculty.friendly.find(params[:faculty_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = current_organization.courses.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:initials, :name, :credits, :availability, :description, :capacity, :enrolled)
    end
end
