import suggestions from '../fixtures/suggestions';

describe('Suggested Search', () => {

  beforeEach(() => {
    cy.server()
    cy.route('GET', '/search/suggested', suggestions)
    cy.visit('/')
    cy.get('#suggested-search input')
      .type('en')
  });

  it('Loads suggestions when users starts to type', () => {
    cy.get('#search-results-list a').should('have.length', 2)
  });

  it('Allows user to navigate to a suggested water', () => {
    cy.contains(suggestions[0].name).click()
    cy.url().should('contain', suggestions[0].url)
  });
});