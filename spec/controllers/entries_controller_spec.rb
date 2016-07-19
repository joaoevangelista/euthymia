# frozen_string_literal: true
require 'rails_helper'

RSpec.describe EntriesController, type: :controller do
  let(:user) do
    FactoryGirl.create(:user)
  end

  let(:journal) do
    FactoryGirl.create(:journal, user: user)
  end

  # This should return the minimal set of attributes required to create a valid
  # Entry. As you add validations to Entry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { title: 'Best day ever', body: 'Some long content', user_id: user.id,
      favorite: false, accomplishment: '', journal_id: journal.id }
  end

  let(:invalid_attributes) do
    { title: 'Best day ever', body: '', user_id: '',
      favorite: false, accomplishment: '', journal_id: journal.id }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EntriesController. Be sure to keep this updated too.
  let(:valid_session) { user.attributes }

  describe 'GET #index' do
    it 'assigns all entries as @entries' do
      entry = Entry.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:entries)).to eq([entry])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested entry as @entry' do
      entry = Entry.create! valid_attributes
      get :show, params: { id: entry.to_param }, session: valid_session
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe 'GET #new' do
    it 'assigns a new entry as @entry' do
      get :new, params: {}, session: valid_session
      expect(assigns(:entry)).to be_a_new(Entry)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested entry as @entry' do
      entry = Entry.create! valid_attributes
      get :edit, params: { id: entry.to_param }, session: valid_session
      expect(assigns(:entry)).to eq(entry)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Entry' do
        expect do
          post :create, params: { entry: valid_attributes },
                        session: valid_session
        end.to change(Entry, :count).by(1)
      end

      it 'assigns a newly created entry as @entry' do
        post :create, params: { entry: valid_attributes },
                      session: valid_session
        expect(assigns(:entry)).to be_a(Entry)
        expect(assigns(:entry)).to be_persisted
      end

      it 'redirects to the created entry' do
        post :create, params: { entry: valid_attributes },
                      session: valid_session
        expect(response).to redirect_to(Entry.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved entry as @entry' do
        post :create, params: { entry: invalid_attributes },
                      session: valid_session
        expect(assigns(:entry)).to be_a_new(Entry)
      end

      it "re-renders the 'new' template" do
        post :create, params: { entry: invalid_attributes },
                      session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested entry' do
        entry = Entry.create! valid_attributes
        put :update, params: { id: entry.to_param, entry: new_attributes },
                     session: valid_session
        entry.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested entry as @entry' do
        entry = Entry.create! valid_attributes
        put :update, params: { id: entry.to_param, entry: valid_attributes },
                     session: valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it 'redirects to the entry' do
        entry = Entry.create! valid_attributes
        put :update, params: { id: entry.to_param, entry: valid_attributes },
                     session: valid_session
        expect(response).to redirect_to(entry)
      end
    end

    context 'with invalid params' do
      it 'assigns the entry as @entry' do
        entry = Entry.create! valid_attributes
        put :update, params: { id: entry.to_param, entry: invalid_attributes },
                     session: valid_session
        expect(assigns(:entry)).to eq(entry)
      end

      it "re-renders the 'edit' template" do
        entry = Entry.create! valid_attributes
        put :update, params: { id: entry.to_param, entry: invalid_attributes },
                     session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested entry' do
      entry = Entry.create! valid_attributes
      expect do
        delete :destroy, params: { id: entry.to_param }, session: valid_session
      end.to change(Entry, :count).by(-1)
    end

    it 'redirects to the entries list' do
      entry = Entry.create! valid_attributes
      delete :destroy, params: { id: entry.to_param }, session: valid_session
      expect(response).to redirect_to(entries_url)
    end
  end
end
