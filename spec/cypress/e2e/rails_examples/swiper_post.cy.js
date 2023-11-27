describe('Swiper Post Display', () => {
    beforeEach(() => {
        cy.visit('/posts');
    });

    it('should display posts in the Swiper', () => {
        cy.get('.swiper-container').should('exist');
        cy.get('.swiper-slide').should('have.length.greaterThan', 0);
        cy.get('.swiper-slide').each(($slide) => {
            // 各スライド内での要素の検証
            cy.wrap($slide).find('.messages').should('be.visible');
        });
    });
});
