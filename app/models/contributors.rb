module Contributors
    @@waters = { 
        jerry_slater: [
            'scoat tarn',
            'easdale tarn'
        ],
        tom_grahame: [
            'ennerdale water',
            'llyn du bach',
            'llyn dubach y bont',
            'loch enoch'
        ],
        steven_cook: [
            'angle tarn', 
            'buttermere', 
            'cow green reservoir', 
            'fishing loch',
            'haweswater',
            'hayeswater',
            'lindsay\'s loch',
            'crummock water',
            'llyn conglog',
            'loch valley',
            'loch nan eilean',
            'malham tarn',
            'loch neldricken',
            'loch righ beag',
            'bea loch'
        ]
    }

    @@bios = {
        jerry_slater: {
            photo: 'jerry-slater',
            name: 'Jerry Slater',
            bio: 'Jerry loves his wild places and he started fishing for trout as a boy, in the streams of mid Wales, and the hill lochs on the west coast of Scotland. These days he tends to be knee deep in small Pennine rivers, or fishing the Llyns and tarns of North Wales and the Lake District. The experience is more important than the size of the fish, and wild is beautiful.'
        },
        tom_grahame: {
            photo: 'tom-grahame',
            name: 'Tom Grahame',
            bio: 'After trying coarse fishing as a teenager and sea fishing on family holidays to North Wales, Tom discovered fly-fishing for wild brown trout through the persistence of a good friend. He can be found stumbling around the banks of Cumbrian waters or the remote lochs of Scotland. A tall man, he\'s the designated pack mule and is capable of carrying campfire wood over great distances.'
        },
        steven_cook: {
            photo: 'steven-cook',
            name: 'Steven Cook',
            bio: 'Wind enthusiast, tippet collector and leader length obsessive. Steven knows only trout. His education was hindered by his lack of attention to anything that wasn\'t trout fishing. If you can find him he\'s usually at the front; over the furthest headland, bay or peninsula, pulling a team of wets and whistling the theme to The Littlest Hobo.'
        }
    }

    def get_contributor_by_water water
       @@waters.map do |k,v| 
        puts water.downcase
            if ( v.include? water.downcase.strip)
                @@bios[k];
            end
        end.compact[0]
    end

end