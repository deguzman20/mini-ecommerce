# frozen_string_literal: true

PaymentOrderStatus.create([
                            {
                              name: 'Paid'
                            },
                            {
                              name: 'Not Paid'
                            }
                          ])
pp 'payment order status created!'
