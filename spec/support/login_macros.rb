module LoginMacros
    def login_with_google
        google_mock(user)
        visit root_path
        execute_script("document.querySelector('div[data-modal-target=\"modal\"]').style.display = 'none';")
        find('button[data-turbo="false"]').click
        expect(page).to have_content('ログインしました')
    end
end