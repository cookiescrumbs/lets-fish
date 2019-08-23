import scrapy


class SouthUistEstateSpider(scrapy.Spider):
    name = 'lochs'
    start_urls = [
        'http://www.southuistfishing.com/permits-boats/machair-loch-permits/',
    ]

    def parse(self, response):
        for loch in response.css('table:nth-child(7n) tr'):
            yield {
                'name': loch.css('td:nth-child(1n)::text').get(),
                'description': 'blah blah',
                'lat_lng': loch.css('td:nth-child(2n)::text').get(),
            }
        
