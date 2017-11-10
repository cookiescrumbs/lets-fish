describe('Suggested Search', () => {
  it('loads suggestions when users starts to type', () => {
    cy.visit('http://localhost:5000')
    cy.get('#suggested-search input')
      .type('en')
    cy.get('#search-results-list a').should('have.length.greaterThan', 1)
  });
});