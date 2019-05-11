# frozen_string_literal: true

Faq.create([
             {
               product_id: 1,
               question: 'How can I roughly estimate the runtimes for my charging devices?',
               answer: 'The Explorer 500’s LCD display is an advanced feature designed to help you better understand power and monitor your consumption. The INPUT side reflects the amount of power your Explorer is receiving while it’s charging. The OUTPUT side indicates the amount power your plugged devices are pulling out of the device. If you have an extension cord attached to the Explorer 500, the OUTPUT will show the sum of all the devices plugged to the extension cord.'
             },
             {
               product_id: 1,
               question: 'Can I take the Explorer 500 on a plane?',
               answer: 'No - since Explorer 500 contains large numbers of lithium-ion batteries and the maximum energy is up to 500Wh, it will be regarded as hazardous goods by the airlines.'
             },
             {
               product_id: 1,
               question: 'How long does it take to fully charge the Explorer 500?',
               answer: 'It will take the 6 hours by AC wall outlet and 7 hours (full sun) by solar panel to fully charge the Explorer 500.'
             },
             {
               product_id: 1,
               question: 'Is the Explorer 500 waterproof?',
               answer: 'The Explorer 500 is splashproof, not waterproof. Therefore it should not be soaked or submerge in water.'
             },
             {
               product_id: 2,
               question: 'What type of devices can the the Explorer 75 power?',
               answer: 'The Explorer 75 can power appliances, laptops/tablets and devices that are less equal or than 75 watts but the length of charge will vary depending on the wattage of the device. It is advisable to do some research to ensure that the Explorer 75 can charge the appliances, laptop/tablet and devices that you intend to use it for.'
             },
             {
               product_id: 2,
               question: 'How long will it take to fully charge the Explorer 75?',
               answer: 'The Explorer 75 can be fully charged within 3 hours.'
             },
             {
               product_id: 2,
               question: 'Is the Explorer 75 safe to bring on a plane?',
               answer: 'Yes – the Explorer 75 falls within the Federal Aviation Administration’s safety limit of 100Wh so it is safe to take on planes.'
             },
             {
               product_id: 2,
               question: 'How do you activate the AC portion of the unit?',
               answer: 'To activate the AC outlet, press the power button for 2 seconds until you see the LED indicator turn on. The USB output port is automatically turned once you insert the cable.'
             },
             {
               product_id: 3,
               question: 'What type of devices can be charged by the SP100?',
               answer: 'Only the Explorer 500 can be charged with the SP100 since it is specifically designed as its charging partner. Do not charge the E500 with any other solar panels as it may damage the unit.'
             },
             {
               product_id: 3,
               question: 'How long does it take to fully charge the Explorer 500 using the SP100?',
               answer: 'It takes approximately 7 hours under a full sun to charge an Explorer 500.'
             },
             {
               product_id: 3,
               question: 'Is the SP100 waterproof?',
               answer: 'The solar panels are not waterproof and it is important to keep the solar panels dry at all times to maximize the lifespan of the module.'
             },
             {
               product_id: 3,
               question: 'How do I clean the solar panel?',
               answer: 'Dust and dirt may accumulate on the surface of the solar panel through regular use. Use a damp cloth to wipe the surface of the solar module clean. Any tape or other adhesives on the surface of the solar panel should be removed immediately since this will reduce the performance of the solar module.'
             }

           ])

pp 'faq created'
