require "test_helper"

module Therapies
  class NotesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @therapy = therapies(:therapy)
      @note = notes(:note)
      sign_in @therapist
    end

    test "should get index" do
      get therapy_notes_url(@therapy)
      assert_response :success
    end

    test "should get new" do
      get new_therapy_note_url(@therapy)
      assert_response :success
    end

    test "should create note" do
      assert_difference("Note.count") do
        post therapy_notes_url(@therapy), params: { note: { title: @note.title, date: "2025-01-01", content: "New note content" } }
      end

      assert_redirected_to therapy_url(@therapy)
    end

    test "should show note" do
      get therapy_note_url(@therapy, @note)
      assert_response :success
    end

    test "should get edit" do
      get edit_therapy_note_url(@therapy, @note)
      assert_response :success
    end

    test "should update note" do
      patch therapy_note_url(@therapy, @note), params: { note: { title: "Updated Title", content: "Updated content" } }
      assert_redirected_to therapy_url(@therapy)
    end
  end
end
