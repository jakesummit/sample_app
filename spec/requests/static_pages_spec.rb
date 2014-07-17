require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
	end

	describe "Home page" do
		before { visit root_path }

		let(:heading) { 'Sample App' }

		it { should have_selector('h1', text: heading) }
		it { should have_content('Sample App') }
		it { should have_title("#{base_title}") }
		it { should_not have_title('| Home') }

		it_should_behave_like "all static pages"
	end

	describe "Help page" do
		before { visit help_path }

		let(:heading) { 'Help' }

		it { should have_selector('h1', text: heading) }
		it { should have_content('Help') }
		it { should have_title("#{base_title} | Help") }
		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }

		let(:heading) { 'About Us' }

		it { should have_selector('h1', text: heading) }
		it { should have_content('About') }
		it { should have_title("#{base_title} | About Us") }
		it_should_behave_like "all static pages"
	end

	describe "Contact page" do
	    before { visit contact_path }

	    let(:heading) { 'Contact' }

		it { should have_selector('h1', text: heading) }
	    it { should have_content('Contact') }
	    it { should have_selector('h1', text: 'Contact') }
	    it { should have_title("#{base_title} | Contact") }
	    it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title("#{base_title} | About Us")
		click_link "Help"
		expect(page).to have_title("#{base_title} | Help")
		click_link "Contact"
		expect(page).to have_title("#{base_title} | Contact")
		click_link "Home"
		expect(page).to have_title("#{base_title}")
		click_link "Sign up now!"
		expect(page).to have_title("#{base_title} | Sign up")
		click_link "sample app"
		expect(page).to have_title("#{base_title}")
	end

end
