require 'test_helper'

class FacultiesControllerTest < ActionController::TestCase
  setup do
    @faculty = faculties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty" do
    assert_difference('Faculty.count') do
      post :create, faculty: { address: @faculty.address, angle: @faculty.angle, camp_id: @faculty.camp_id, coords: @faculty.coords, description: @faculty.description, fid: @faculty.fid, icon: @faculty.icon, name: @faculty.name, tilt: @faculty.tilt, url: @faculty.url, zoom: @faculty.zoom }
    end

    assert_redirected_to faculty_path(assigns(:faculty))
  end

  test "should show faculty" do
    get :show, id: @faculty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty
    assert_response :success
  end

  test "should update faculty" do
    patch :update, id: @faculty, faculty: { address: @faculty.address, angle: @faculty.angle, camp_id: @faculty.camp_id, coords: @faculty.coords, description: @faculty.description, fid: @faculty.fid, icon: @faculty.icon, name: @faculty.name, tilt: @faculty.tilt, url: @faculty.url, zoom: @faculty.zoom }
    assert_redirected_to faculty_path(assigns(:faculty))
  end

  test "should destroy faculty" do
    assert_difference('Faculty.count', -1) do
      delete :destroy, id: @faculty
    end

    assert_redirected_to faculties_path
  end
end
