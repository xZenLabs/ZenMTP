#!/bin/sh
# Name: ZenMTP
# Author: Anthony Gress
# Icon: data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAZ4AAAKWCAMAAABOGQ/NAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAMAUExURf///yIiIjMzM9zc3Hd3dwEBAevr6wAAAOnp6fv7+5mZmejo6PDw8JeXlx8fH7i4uAICAqmpqff391VVVZKSkv7+/vn5+Y6OjoiIiCoqKrW1taqqqoODgwYGBjIyMjw8PLCwsGRkZAMDA1FRUd3d3f39/QUFBR0dHQQEBO7u7hMTEwcHB5+fnwoKCvz8/AgICBwcHAwMDAkJCRgYGPr6+tbW1vT09A4ODiUlJV1dXQ0NDba2tpCQkBEREWhoaERERH9/f9vb2xcXF25ubhUVFSQkJJGRkVtbW/X19SgoKDExMTY2NtLS0iMjIxISElNTUxkZGerq6isrK7u7u3R0dHt7eykpKbS0tJiYmO3t7V5eXklJSRQUFPPz80ZGRhAQEDAwMCEhIeXl5fb29k1NTVlZWZWVla+vr5aWlpOTk0JCQktLSwsLCyYmJvHx8ebm5mFhYUpKSkxMTBoaGuDg4G1tbWVlZRYWFj09PXBwcBsbG05OTsjIyImJiSwsLOPj41JSUkdHR3x8fKampicnJyAgID8/P1xcXE9PT/j4+Kurq+Tk5MLCwlpaWjk5OcHBwVhYWHFxcT4+PoqKin5+flZWVr+/v3l5ebq6uo2NjR4eHtfX18rKysfHx3V1dQ8PD0VFRXZ2dmZmZi0tLZSUlDg4OLKysn19fYeHh3Nzc6KiooaGhqGhoXJycsPDw+Hh4cDAwMvLy1RUVNjY2ISEhNPT0y8vL2tra6WlpfLy8js7O2JiYtTU1Kenp4yMjENDQ7y8vGlpaWxsbF9fX8nJyWBgYMXFxZqamjU1NUhISGNjY7e3t56enr29vaSkpKCgoOLi4uzs7MzMzO/v76ioqN/f36ysrEFBQW9vb76+vq2trVdXV4CAgNnZ2bOzs0BAQIGBgTQ0NDo6Otra2o+Pj9HR0c/Pz97e3i4uLp2dnTc3N4KCgpubm4uLi+fn51BQUM3NzYWFhaOjo7m5uZycnGdnZ9XV1Xp6esbGxmpqaq6urrGxsdDQ0MTExM7Oznh4eKxQvzYAABoTSURBVHja7N15cJTlHcDxl2N5CAIuiaEgRoaUhBAEEoSEMAkJhADhSAMN4SaACHKFU8Ih9w2KlHZa7rMoTiOHBFopx1SRQ/Gi2lasKNaqbUX4B5xe0+4SlH1332f33e277/t05vv9IyOz7+LM78Nu3n3fd59X04iIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiP7fqj+k16jV9coZhJK9lyq8jVjHKBRsi0tU5/qMYSjX98S9mjAOhXXwUVsHH7V1hKsnQ1FXBx+1dfBRWwcftXU8Pg8wHHV18FFbBx+1dfBRW8fjM5EhqauDj9o6+Kitg4/aOh6fnzMsdXXwUVsHH7V18LG5LQEAqUH+5PWpx9AcfO2kndP9sd+jAT7jGZtzOt3q6v4c0wkflXQ0Px4NH5V0AnjwUUknkAcfhXQMeIx8nmCAjugY8eCjjI4hDz6q6Bjz4KOIjoTHyKcBg7RJp9V3OjIefOwq8Dhbq1paSB6tXw//p7kvMUzLe9sVTEfOY+CT+CbjtLixU4LqBOExeH/rH8NArS0vuE4wHoPXzxsM1NqaB9cJyhPoM4iBWltBcJ3gPAE+XRmotV0LrhOCx9/neQZqbU8G1wnF4+ezmYFa2zF3UJ2QPLr9t6ntGKjF7QyqE5rH5/WTfJBxWl27W3eHO7ClFhGPtq20+sGywUwzCl2dmyjEyocytAh5tLVPfDyi7ehBdRhldOrd8j7ZQ2Z4yLHggYfggYfgIXjgIXjgIXgIHnjIAZ5Og8b1rWmqEy/1fJeh2srT+JXEcL5sv4uLSe3kSVojwiybsdrHMzFcHZHYj7naxZOUFjaP2Mhc7eL5PHwd0SWJwdrE888IeMQ0BmsTT6NIeGoxWHjggQceggceeBzmKWwm61fwOM/TXPr3xMIDDzzwwEPwwAMPPPDAAw/BAw888BA88BA88MADD8EDDzxG3XelZFzT1PSEnP6T9p6/HQ+PQs0+cNxv0d15l+FRpLM33AbXM224Eg+P87WcKbvg7MLT8Dhc0oEOQW6r3PVleJyszsXgV2x27gePcx3dGuqK2vSrlvGsbOLTziqfP1TBY9TnFaGveE5ebhUP11iHuVNQYWZaiVfgcaJ3p5obV4cd8DjQOLPzSqsDj+01MD+wG/DY3dj0MCb2D3hs7rXAuRTc+uQvDfJeLQ58ZGtsZDyDI+H5GhztpP9htoT8k98eSHjq8YD7YT4QGc+2CHQyWRVE0173G8pw3R1gLj/s9/D8jhHxaIXh86wGRxvQXj+TPX7/ZHt/aOa3T2ie8H/5tDmKjjZEP5OHAjaIH6bfYmZkPPrbz5nI/Qg4mparm8njBmd2Yvfr/1H3joxHy84MR6fhg9hoWkay70wqDE8bdEsIec9eU2uJtn7kDxvjfJrv+5xFvo+sLpmwFhtPT+vmOtF4o1d0G+2MlMe/7wd/VyVNu+47oqLGxhst1u1eX4THtub4jmiYbKu+ut8K8NjWcN8RvSfb6m+6E9sx8NjVaN8R3ZRtdUo3/aHw2NVAU2t3Pqub/vvw2FWp74jKZVtd1k1/Njx2pTuk9pFsK/3x5nfhsasZviP6qWyrerpdg8bw2NXrpkaUpbvqmh1r29riO6Kako3apfpulQuPben2yVySK0En6Ib/Ajy2NVJ3uHOG8YunqW74V+Fx6LCBGGy0SU/9xaLl8NjXJf3p/ZOBWxzUn08Yp8FjX0P1wy8IuHjpSA/9ebJm8NjZdP30U/0+/Cz3+9ZP8Vp47KxWit85/rgv7j24Lc7/JPNpDR5be8ZfoP2SyvVJmhbzRYOlATdL7J4Bj70dMrpEI3l+sdG3gMVbGjw2N8T89TO5Gjx2F3/GrE7Fenjsb0CByTuJbtbgcaA/pZrRcX2lWclT/xo8JtuRY4LntGYhT/zb3QU8ZuvUMOQ7WwPNQp7PTwgBj/mm9Q2uM+J+zTqeob8J+EAFT/BiqhKC6IwKfgfesHiSzo/g/vLh9+dNMpxWb4VYkyocnqeuGf0vrjL/kB2eZDS5rdd7h3qieZ4BrxsejSjLYPom+tc3nfVza7tknYnf9GZ52k2U7CL+kdGb7BPfsS14zNRzTPIcPC47WNSOuZvsAd+5tdCs45m22iVbLa4xY3eYJ0b65cXCzQzdaZ7DiyQ4ZU146TjNMzZL9r6WdR8Td5inY3YXyUunz7+Zt9M8bzaV4ORks8PmNM/iLNn5iawBDNthnseayJYjq7mDUTvN81wNCU5RNstNOc3TbbJsvZysOszZYZ7eee1la/5vZ8pO8zwnO/9aXBnPkB3m+Ui25n9KfjkjdpgnI6+NROfjYwzYaZ63i2VnXRsxXud5ZDdhyH+Z6SrLM+k2s1WWJ62SySrLk5A/ksEqyzOzJWNVlqdgMENVlqdtXiwzVZZn5vtMVFmeqW8wz2jyTP9feLpc78g4o8rjzqobMc/MQwwzyjze6zViIuLh4kJbeDyDvj98nrLsGCYZlcYHvhLiDoXH45pelzlGqQlGdyytPTIMnj7nmGLUmm34/aiVvzPPw/Vr0WyG5ITAMbM8XIYT1ZePZBGKlL114FGgc7Nk356vlwSP89WVfd9D9DkIjwId2SA9xjkbHueLr+wexhkCeGzvt7Vly4T0bwaPAn00XHrVzUl4FEj6BZDk/PrwOF9j6ddCU32/eQiPU62X7mTXPAePAj0rW2rFFfcOPM6XVNlDAjQlby08ztc6P0UC1PkqPAq0bZR06fFO8Kiwk71SupNdDo/zZSyTfZd3VjY8CiRd4UPAo0QfLIJH5WLqpcKjckPzE+FRuZsn4FG5+GZb4VF6J1u6sAQ8StRtJjxK98Om8KhcR8nS1PAo0rS9bnhUzuiCOHgU2skOvCAOHpUKuCAOHrXyuyAOHsVqDA88BA88BA/BAw/BAw/BQ/DAQ/DAQ/AQPPAQPPDAAw/BAw/BAw888BA88JCdrd1+Xsfz4qUjjzEVJWp95e99kv2+QFIsRGLpsEvcrNThFv/iQqJI7FFR9GiRbhG+qTXSVvR3ic55R5mRU8UuX5ooOuQUSdaCTa5RMDBd/PUUd/dz5E2tqkKkZObov3hVlpOje6Mbs6+zu9XCcqZlc2NLuogpqd8t7+ZeNHfS0hlrbuSuiYvr9eqv59zqmnv33c49+kRm0YEMJmZjI79pL6bMSv92Pd5ZK75M93tncxf2mvfi5OqFQ1ZsKKrI5i3OtibMEm3aJoRe1q103s/O3FkDe9+nbZp+wNxsqc5GIXalC3PtX5Z/Z/m3LweKx1szu+h3Lk24zeJ4K3qx9gjvzWlzc8YcYXpRLv6zZNE+UYRVWcmPvPsQfae2eYIBRrXyH3g+z7hFuLU6sMC7XO9uV0k8M4xeXw8UbpeIpN1NdgnRdnKb17hVc9SaVujZYzYLktJDt2nR6U2eXfBVOQtimWN0Wj81rBeMq//DG3yXJW/R1fPj993H8QkoKi3uHPZbWsqqNQXV/+X9lLRpoedj6vDiD9sxyyjsFYRcXzx99EtP1q5du2vWxdJ7r5q+LUrvvJTGZAqxcvwUIc6UTWf/wPJiRgWlufD8g+/4bJ3UckJ+4d2HPt5zZ0GxMWOEeHSIZwfhRoc8xml1e4PYVJRsM3rKF1XVa40mdx3m3d0r7uO9qXO6cG90NWKe1vZjOc7cZvJf9tsXVB9zG1/s3XlrLkT38SkifVTby0zUyg5L96fPnA3+zJvjvFt1qJrr+ZmZK0ShBzrt+Ap2ry2sfkPZ/Zm/Cv3kN8Z4t3wh33vgbbcQq37p+ZBatoehWlcLic6+22ae3bvEe9+5jcs8P7pPEmJnTeEalrKdqVrVWclbWy+zV0sd9p46XVLl+VHYR7jrZYq0/X3Zu7aopGvGRwV+Yn7CR/t7nvCMd/9i1Xwxa6EQkzusY7DWdMpQJ6EynL9jwKeep8z7j+fHh4lizqr/snfmcVGcdxgfiMvjBW6KKB6LCoIECgQ1ihtFinIIMagREVABFfGsoKJQQEVACPHi1lgVb4Uara0n3keSJo3xxquNUVPPtvFIq0maT2YGogLvIOy7i24/v+8fu/i+M7+deR7feY+ZeV84LJlCgzt6wXUYs+w8qF+UHuXiTn/YLrYm7KC654aDI8xJWn3wgFl48usbxv8rsX1d6AN8OgVtNgN2GXRvQR+jOcyR0Oj61+zNbwHpHzmILQoVDvTEIqf9JC4/v2a5s1OXbuVWsf3WKB8Y8RdENYLqsimJyw9roNpdt0enOwKOj9eKXSBHbNIiWkPPVnHzmFV4fHUM5gdc+0J0Nwkeu6AdFU3yGmLAYK2uN9SaRQAhk8SaS4PxKli6nSF9ORsGrDVk03QO1xuI/KMKTpYICkdqt+EkMB9LGe6Y6H43upXYsD4vFp8LcPSFpiCXBObjMMMenocJzwLrC4EOszFBI17j/ElhLqJquuPE89qo/QDgp3QgDJapiHM+RArzcJ1ReIZyRbwtBkgBCtCzN7wT5pHEPJgz7NnHFbGHFhlvAQHT0RQ4Pook5uF4TXcGcoYsA37MgGoSrCNQ1oUk5oGxrK8fZ8gfgDxPYDuywhGm2kMac1TkDjXtyeOMuUeDuBigF2blI6sP3dPmYDSj6mnBGzQBg0SLslZhAgJMd5PIurOCYc9o3qCrATMbpAeK9jhlHSCRuTqR1XHjfoTje6AwDA6XRXtwfCWJrDv/rGnPAO6g54B1Ys/HD8s0WNKLROa6DlUnlb+94YL8s9K4wRUnLKSODwfxNe2ZxB91J+ILgaMYmoE1CSSy7jBu9nzFH7UYmcullrXnbHiuJ5F1x4/xIg9/1AKMnQHEolMkZtLzBhzMZdzs4Y8aBrvR0sUt0QczbUhk3QlivJPAHzUafo3FNjU2euNwKomsO56MbmlzPZg+U2xceyJvMnaFkci6k8+wJ5k76kTkfAMcwTq4lFG3lIMJDHtac0dtA9/F0uMG42ExahyJrDuvM+zZzh31XbR9AByGOcqjFpPIupPMsGeEPWfQUOD6XbgXqMfjiO0pEll3fqsyQOXzGM7djyIwckg/bB5EGvPwJsMe3sc3miJXuIUwh06BSJxGEvPAmgpkOudrbceR7++IzzBO0zN2E0nMQyLrAXjOO5we+EJsuH2H27DzWUAS8xDDfLmH645cZ2jHBKNLatRGFDnT7BN8bQMHlj/teEL6IkywwfGuR0wR3JcU5iOXOT81T+0zES3mqDAUf1WtLfYlgfkoZb73e1/3gHPU3VxTMLDA6QZyHGkFGU52MO1x033dF2tcEdZiy+QtNhovutnDTSTTH9NWOoZrYuEemgxVjuoELCPvkby8HGBPp3NBx3D7sUWwxPwh5WtwN4LWJeFmqsKU77rV6k2GaKd2tsURlLhEFgwldfmZxLZH/UCXYMORIsQiYHZCDqy1zUhcfhYoTYKsw+CBWf/0VjtskYm0rja9NpO2+mC+gj/q+r9XHa2+KJbGvhZxu1C6igqPXliqNI2our6T4pxHkdAObt+5ZNsWp94nZfVDgpI/mof1itM5Yn33UG88iSi1mbwuiobb9MQxxUVHev6mHmHGmE4/KRQgoNg0BX/+8BLpqi8WKs5hHVD3MmBVoP2HYA73Le6X3DqssSNV9cZWF0V/+tU5SCPnFsJpN2x2M5/tdG8EtQv0yDpFe2y/rWOIu10/F2YMgqdJ7GHV8Fnfk6Z6xEp5fYv1dbs356U9JLzRBpkJBw/gwl6abUK/zOmj6E/bOuzuustkn/CGKZKCZn+pDuqVZE+K6pcQxUUU5r945zPhcackdzosnJLmUpx/hyY60jvzFIvP9Rft+u0tXyvhZhtMtGyT7X4nb4oZqal3XMOV7LGufcfupdNeE4QV3ogrjozR5rYeeJLENAAjP1Wwp/a3TR/6vS1+ttSojw4LKpmc1NpkBklpEAans+2pbQ6kxmmHxE+zIPTPGXGlVB1bNIDcMRQf+LCX9H3Rfq/PQtDQLuf93Fr7BVK9YzhOMieEv1b7TvtSMWvT3qQNJh4xNvE0DmpIevRjtK9P1LbHnzo52kbvmlIS7OB5z+cHUtDArIir9uzB5Ka1bH1xmlqVmjgkeH+USXav8g9IPsMTmmbX9ak5/Vcqa37mUQCc5870SAwZpfVq6TOOhgoaCP+3Nwctuta3LO9jRcnPNU1yxp3VOZFXNsx1jr+0KJOGqF8OW9t7frL4X891Q8919Mr6EJqE+PiDdrd9A5yKYuJmF5JOLwkrs91Xx1q4dDHtK5I7zAlw9Bh7JCex0+GStrE9J5qfnR+QTde1l4Z958bLTycfWnZ/XqMrG/utDi5KLJq3Oif797vDMrK+XBFsUkCvWL1cXrsYcmL3xzt+PBbSrt2G9xYUhrTMGeuRm5O9bePXfR+Fkj6vAO+/c/5A0bz4o0mWfvFeww9t21AaN+TyeGoPvDK4jgkd/c7DtNItseEBgUHB7eaQJARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARB/H9xs5Ey/zXwb/+q4me8rBS3eFSxxd+qJCY3qpX2VUOMrJZ91bpkxUijsWcxlNEY+LebV/7ORaUNQitX1GxRJXU4asW7aoxmrBPLNR9J9tTVniVKG/SGYewR6dOyCdlTN3s0gxU2aGM4e4D5jY3AnmMmLJzkExjWQPYghZ2/AEx70p4/0hFSvuPzKYEse7o9zR70dAni9MaCcdIqUj7pYw1ljw+7cZDJtqcK5lK+RS0/UmFP22cJVuceBVaE3etqnPYUyUefLzSUPTjEyj7lZhB7JCZo5NRlRunO/+RF4r/u3nD2WLKyW8Ng9giFzvIC6z2M0J2RA6VD7/qW0CD2vCn9X9AwFiy1GiBnG8YewVpOPmGE9qyRj7y30DD2BEyTPjfVzN0mN8M+M5A9PSYrltpXmxCVdOAHlbvygn/M3Sd+idbZCu1h/84ip6S/mixovdmvbGXJ1lrsGRYifZrUXMR8oZReFGsge4Ro+WeNzh2zbtJxR5xU3GD5EpfKKsF2bDJrg45S3i7RnBu/q9xQNem0oj1RrhbS18MaxyHVDuqb0YayZ5mUrDa6pe2D5NMpURwn6+fwXNdO9eR9BXuOCj/tfG5D59tK9kwX2ktfQUz5wgU7Q9nTTk5vbmTulIAp1tNRsA7V+t7lY9j2bH+8qsp26hYK9rwrTJUMd5harWGQLmX+IIQbyp7dcrq/cbmzVRa1m5lSZV45zGKT6Zk5oOLPhWx7PLTytb187J3KS6H3GLY9LpUF9n61lq+U1sVVmGgoe1IaYthKz9jLauDvCtlWcyvK1nX5X8mR7DPv+MuVr+wbuaXwqKIcfcK2Ry0I70nfGfY1a+6rgnDNUPbIpzLEuOy5IZ/LTKXs8XL2jafymkr/HNiKbY926S8JO+Rhrg4K3dLugpWP9P3581mDpYaB42hBsDGQPWfkIYleRuXOf+RjNlG6FzLGW8re8ixhqruUEMO0x+2jZylecj+3O9uePYKQJ33/++f27SS0iSiO4/jDLdqqhNbiikoIaheFlrZKRaUoVVygtqYu2IJVVHABtYrUQ11A3PCigtQquBYVxCoiblC9uQuKCCoepMUFBb14te8/M0nGThJJZg4D38+lkzePkOSXzLz3f6/xp37olt09BzUexXNGmt/6KZ1S+aqGriU6f0HuB/GFkHbrU+wdT/xEs0xaupzjWWwOovVvJXoV3WQNthd5E8/LoG5tPuinePbKO+mX8Pw0fboqvqVJfielDvFU21a7puqmWud4XllT0O+xM8/lqqnvRs1exPPznEy9A1l+Suf0JP2SvyT8RnXp0xPspQIZyXU7xDPS1rTI8UpixFOpzJWd1lh9/71+fEwfFbgTz69ay7r1xxvMqdvWPB+lUy4/jsKuhB2G6fMXHSovz1LGM183vXSO51Y05qXWiYG63l8oX4Rid+JxMs5X9eqHyRYuNalOPrS3RXRbe8p45KZW5BxPhz6s0ke7bHMSY0I1yat4+t/O8VM6T+VyPC7JAuIauZv2sZFbw+yM4pGRyGs9eQ21mAMDGWgfkaJqwJt4QlvafDWmXr5Nv+ricJIuRxNdJVZkFE+nHEtl+oPR3hmbMdZ7EM/G83OXNfqs1nYiwcw+zqZE8eRmFM90owQha29TYq9lmBzmuxTP17BluR9XSF/Im9iTdCgz1Mt4jC6XohWDknxX4xml/Kxlhn4PK38m7VSn+zzJ6q3WjXhk99oGfSTrzPcU8UQn6Y/lPYxO3mun7jMk9bOlF0+9nroGm3pejAzw24jHPqNJWR+UGu8Sr+JRM80x+kn9t48iHsspWZJpTbVyKHOco57F0y3j9kHqRvwYhXjUINk0GXyeqp8UwkJNXsWjvulH47N1xaXiDvFYpNwfeJeyX44s20Q8i6dIdhdcNTeSEI+hTeomdatT95S7w+RKW1vl8Dy34lmth4/Bat22kHhM82TPwISO/+galiAXbI5ralwVuFHvUjzqnTWRuquIx7Q9YK7q/4dH0vfi4WjDdV1zqxngUjxl/c14fhOP6aR8JBVrs5w8+PfuIx9zYOoII6D7M2Wv/IE8l+JR+410CnKIx7Qj2T+a9drjGp5o7lqreZzbYB7bLnaZxbPPeMbLinjSikc1jv23z6fByrV4Ds6RlZjPxJNmPKr8z+T4HiVjpij34lFndcMsRTzpxqPU4SXTrPOt/bJdnPf06Ks30BwinszcfFMViQy/8lEBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbvoLuM1UFkybQYYAAAAASUVORK5CYII=
# Created: 2026-05-14
# Version: 1.7
# Description: Switches Kindle to MTP mode for file transfer and returns to koreader if applicable

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SPLASH="$SCRIPT_DIR/zen.png"
LOG_FILE="/tmp/zenmtp.log"
EIPS_BIN="$(command -v eips 2>/dev/null || true)"
SPLASH_STOP_FILE="/tmp/zenmtp_splash.stop"
SPLASH_PID_FILE="/tmp/zenmtp_splash.pid"
ZENMTP_RESTORE_FLAG="/tmp/zenmtp_restore_needed"
ZENMTP_SETUP_DONE_FLAG="/tmp/zenmtp_setup_done"
ZENMTP_MAIN_PID_FILE="/tmp/zenmtp_main.pid"
UPSTART_DAEMON_CONF="/etc/upstart/zenmtp-daemon.conf"
DAEMON_LOCK_FILE="/tmp/zenmtp_daemon.lock"
DAEMON_SCRIPT="/mnt/us/.ZenMTP/zen_mtpd.sh"
DAEMON_VERSION="14"
GDIR="/sys/kernel/config/usb_gadget/mtpgadget"
UDC_HW="$(ls /sys/class/udc/ 2>/dev/null | head -1)"

# ============================================================
# Logging
# ============================================================

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') $*" >> "$LOG_FILE"
}

log_cmd() {
    label="$1"
    shift
    out="$("$@" 2>&1)"
    rc=$?
    if [ -n "$out" ]; then
        log "$label rc=$rc out=$out"
    else
        log "$label rc=$rc out=<none>"
    fi
}

log_job_status() {
    job_name="$1"
    status_out="$(initctl status "$job_name" 2>&1)"
    rc=$?
    log "job $job_name status rc=$rc out=$status_out"
}

job_is_running() {
    job_name="$1"
    initctl status "$job_name" 2>/dev/null | grep -q "start/running"
}

wait_for_job_state() {
    job_name="$1"
    want_state="$2"
    timeout_secs="$3"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if [ "$want_state" = "running" ] && job_is_running "$job_name"; then
            log "wait_for_job_state $job_name reached running at ${elapsed}s"
            return 0
        fi
        if [ "$want_state" = "stopped" ] && ! job_is_running "$job_name"; then
            log "wait_for_job_state $job_name reached stopped at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_job_state timeout job=$job_name want=$want_state timeout=${timeout_secs}s"
    return 1
}

run_upstart_cmd_with_timeout() {
    label="$1"
    cmd="$2"
    timeout_secs="$3"

    sh -c "$cmd" >/dev/null 2>/dev/null &
    cmd_pid=$!
    elapsed=0
    while kill -0 "$cmd_pid" 2>/dev/null; do
        if [ "$elapsed" -ge "$timeout_secs" ]; then
            kill "$cmd_pid" >/dev/null 2>/dev/null || true
            sleep 1
            kill -9 "$cmd_pid" >/dev/null 2>/dev/null || true
            log "$label timeout after ${timeout_secs}s"
            return 124
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done

    wait "$cmd_pid"
    rc=$?
    log "$label rc=$rc"
    return "$rc"
}

# ============================================================
# Diagnostics
# ============================================================

debug_snapshot() {
    log "debug snapshot begin"
    log_cmd "pwd" pwd
    log_cmd "initctl help" initctl --help
    log_cmd "process snapshot" sh -c "ps 2>/dev/null | grep -E 'tizen-mtp|/usr/sbin/mtp|framework|lab126|appmgrd|koreader|luajit' | grep -v grep || true"
    log_cmd "mount functionfs" sh -c "mount 2>/dev/null | grep -i functionfs || true"
    if [ -r /sys/class/power_supply/usb/online ]; then
        log_cmd "usb online" cat /sys/class/power_supply/usb/online
    else
        log "usb online rc=1 out=missing:/sys/class/power_supply/usb/online"
    fi
    log_cmd "udc list" sh -c "ls -la /sys/class/udc/ 2>/dev/null || true"
    log_cmd "gadget dir" sh -c "ls -la \"$GDIR\" 2>/dev/null || true"
    log_cmd "gadget functions" sh -c "ls -la \"$GDIR/functions\" 2>/dev/null || true"
    log_cmd "gadget configs" sh -c "ls -la \"$GDIR/configs\" 2>/dev/null || true"
    log_cmd "gadget UDC" sh -c "cat \"$GDIR/UDC\" 2>/dev/null || true"
    log "debug snapshot end"
}

# ============================================================
# Display helpers
# ============================================================

force_refresh() {
    eips -c > /dev/null 2>&1
    eips -c > /dev/null 2>&1
    sleep 1
}

show_splash() {
    [ -z "$EIPS_BIN" ] && return
    if [ -f "$SPLASH" ]; then
        "$EIPS_BIN" -g "$SPLASH" > /dev/null 2>&1
    else
        "$EIPS_BIN" 0 0 "ZenMTP" > /dev/null 2>&1
    fi
}

stop_splash_daemon() {
    touch "$SPLASH_STOP_FILE" >/dev/null 2>/dev/null || true
    if [ -r "$SPLASH_PID_FILE" ]; then
        splash_pid="$(cat "$SPLASH_PID_FILE" 2>/dev/null)"
        if [ -n "$splash_pid" ] && kill -0 "$splash_pid" 2>/dev/null; then
            splash_parent="$(cut -d' ' -f4 "/proc/$splash_pid/stat" 2>/dev/null)"
            if [ "$splash_parent" = "$$" ]; then
                kill "$splash_pid" >/dev/null 2>/dev/null || true
            else
                log "stop_splash_daemon skipped pid=$splash_pid ppid=${splash_parent:-unknown}"
            fi
        fi
    fi
    rm -f "$SPLASH_PID_FILE" >/dev/null 2>/dev/null || true
}

start_splash_daemon() {
    duration_secs="$1"

    if [ -z "$EIPS_BIN" ]; then
        log "start_splash_daemon skipped: eips not found"
        return
    fi

    stop_splash_daemon
    rm -f "$SPLASH_STOP_FILE" >/dev/null 2>/dev/null || true

    (
        _i=0
        while [ "$_i" -lt "$duration_secs" ]; do
            if [ -f "$SPLASH_STOP_FILE" ]; then
                break
            fi
            if mtp_looks_healthy; then
                log "splash daemon stopping: MTP is healthy"
                break
            fi
            if [ -f "$SPLASH" ]; then
                "$EIPS_BIN" -g "$SPLASH" >/dev/null 2>/dev/null
            else
                "$EIPS_BIN" 0 0 "ZenMTP" >/dev/null 2>/dev/null
            fi
            sleep 1
            _i=$((_i + 1))
        done
        rm -f "$SPLASH_PID_FILE" >/dev/null 2>/dev/null || true
    ) >/dev/null 2>/dev/null &
    splash_pid=$!
    echo "$splash_pid" > "$SPLASH_PID_FILE" 2>/dev/null || true
    log "start_splash_daemon pid=$splash_pid duration=${duration_secs}s"
}

# ============================================================
# MTP helpers
# ============================================================

mtp_process_running() {
    ps 2>/dev/null | grep -q "tizen-mtp"
}

functionfs_ready() {
    mount 2>/dev/null | grep -q " on /dev/usb-ffs/mtp type functionfs"
}

udc_is_bound() {
    [ -r "$GDIR/UDC" ] && [ -n "$(cat "$GDIR/UDC" 2>/dev/null)" ]
}

mtp_looks_healthy() {
    mtp_process_running && functionfs_ready
}

wait_for_udc_bound() {
    timeout_secs="$1"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if udc_is_bound; then
            log "wait_for_udc_bound reached bound at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_udc_bound timeout after ${timeout_secs}s"
    return 1
}

wait_for_mtp_runtime_ready() {
    timeout_secs="$1"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if mtp_looks_healthy; then
            log "wait_for_mtp_runtime_ready reached ready at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_mtp_runtime_ready timeout after ${timeout_secs}s"
    return 1
}

wait_for_mtp_health() {
    timeout_secs="$1"
    elapsed=0
    while [ "$elapsed" -lt "$timeout_secs" ]; do
        if mtp_looks_healthy; then
            log "wait_for_mtp_health reached healthy at ${elapsed}s"
            return 0
        fi
        sleep 1
        elapsed=$((elapsed + 1))
    done
    log "wait_for_mtp_health timeout after ${timeout_secs}s"
    return 1
}

restart_mtp() {
    log "restart_mtp begin"
    log_job_status "mtp"

    run_upstart_cmd_with_timeout "stop mtp" "stop mtp" 8
    wait_for_job_state "mtp" "stopped" 8 || true

    run_upstart_cmd_with_timeout "start mtp" "start mtp" 10
    wait_for_job_state "mtp" "running" 10 || true
    stop_splash_daemon
    wait_for_mtp_runtime_ready 4 || true

    log_job_status "mtp"
    log_cmd "mtp process check" sh -c "ps 2>/dev/null | grep -E 'tizen-mtp|/usr/sbin/mtp' | grep -v grep || true"
    log "restart_mtp end"
}

bind_udc_if_needed() {
    log "bind_udc_if_needed begin"
    if [ -n "$UDC_HW" ]; then
        log "bind_udc_if_needed fire-and-forget bind to $UDC_HW"
        ( echo "$UDC_HW" > "$GDIR/UDC" 2>/dev/null ) &
        log "bind_udc_if_needed dispatched pid=$!"
    else
        log "bind_udc_if_needed skipped: no UDC_HW"
    fi
    log "bind_udc_if_needed end"
}

force_udc_reenumeration() {
    log "force_udc_reenumeration begin"
    if [ -z "$UDC_HW" ]; then
        log "force_udc_reenumeration skipped: no UDC_HW detected"
        return 1
    fi

    echo "" > "$GDIR/UDC" 2>/dev/null
    log "force_reenum cleared UDC rc=$?"
    sleep 1
    log "force_reenum fire-and-forget bind to $UDC_HW"
    ( echo "$UDC_HW" > "$GDIR/UDC" 2>/dev/null ) &
    log "force_reenum dispatched bind pid=$!"
    log "force_udc_reenumeration end"
    return 0
}

# ============================================================
# Restore daemon -- post-MTP restore: KOReader
# ============================================================

ensure_daemon_upstart_installed() {
    daemon_script="$DAEMON_SCRIPT"
    desired_marker="# zenmtp-daemon v$DAEMON_VERSION path=$DAEMON_SCRIPT"

    if [ -f "$UPSTART_DAEMON_CONF" ] && head -1 "$UPSTART_DAEMON_CONF" 2>/dev/null | grep -qF "$desired_marker"; then
        return 0
    fi

    if ! command -v mntroot >/dev/null 2>&1; then
        log "upstart install skipped: mntroot not available"
        return 1
    fi

    log "installing upstart job at $UPSTART_DAEMON_CONF (mntroot rw)"
    mntroot rw >/dev/null 2>&1
    rw_rc=$?
    if [ "$rw_rc" -ne 0 ]; then
        log "mntroot rw failed rc=$rw_rc; cannot install upstart job"
        return 1
    fi

    cat > "$UPSTART_DAEMON_CONF" <<UPSTARTCONF
$desired_marker
description "ZenMTP restore daemon"
author "ZenKindleMTP"
# marker: $desired_marker

start on zenmtp-restore

task

script
    exec /bin/sh $daemon_script
end script
UPSTARTCONF
    write_rc=$?
    chmod 644 "$UPSTART_DAEMON_CONF" 2>/dev/null || true
    mntroot ro >/dev/null 2>&1

    if [ "$write_rc" -ne 0 ]; then
        log "upstart conf write failed rc=$write_rc"
        return 1
    fi
    log "upstart job installed successfully"
    return 0
}

start_restore_daemon() {
    daemon_script="$DAEMON_SCRIPT"
    log "start_restore_daemon begin main_pid=$$ script=$daemon_script"

    if ensure_daemon_upstart_installed; then
        if initctl emit --no-wait zenmtp-restore >/dev/null 2>&1; then
            log "restore daemon dispatched via upstart event zenmtp-restore"
            return 0
        fi
        log "initctl emit failed; falling back to double-fork"
    fi

    ( setsid sh -c "nohup sh '$daemon_script' </dev/null >/dev/null 2>&1 &" ) &
    _wpid=$!
    wait "$_wpid" 2>/dev/null || true
    log "restore daemon dispatched via double-fork (intermediate pid=$_wpid)"
}

# ============================================================
# Main
# ============================================================

stop_splash_daemon
log "ZenMTP v$DAEMON_VERSION main_script start pid=$$"

# Clean up flags from previous incomplete session
rm -f "$ZENMTP_SETUP_DONE_FLAG" 2>/dev/null || true
rm -f /tmp/zenmtp_from_koreader 2>/dev/null || true

# Save raw brightness before MTP (framework may turn it off during teardown)
for _bl in /sys/class/backlight/*/brightness; do
    [ -r "$_bl" ] && cat "$_bl" > /tmp/zenmtp_fl_br 2>/dev/null && break
done

# --- Start restore daemon ---
touch "$ZENMTP_RESTORE_FLAG" 2>/dev/null || true
echo "$$" > "$ZENMTP_MAIN_PID_FILE" 2>/dev/null || true
# Signal daemon that ZenMTP was launched from KOReader
if [ "$ZENMTP_KOREADER_HANDOFF" = 1 ]; then
    touch /tmp/zenmtp_from_koreader 2>/dev/null || true
    log "zenmtp_from_koreader flag set"
fi
trap 'rm -f "$ZENMTP_MAIN_PID_FILE" 2>/dev/null || true' EXIT
log "wrote restore flag + main_pid=$$"
start_restore_daemon

# --- Splash while MTP starts ---
# The splash daemon stops before each draw if MTP is already healthy, and the
# MTP restart path stops it as soon as the mtp job reaches running.
show_splash
start_splash_daemon 30

# Stop usbnet jobs
for JOB in usbnetlite usbnetd usbnet-autostart usbnetwork usbnet; do
    stop "$JOB" >/dev/null 2>/dev/null || true
done
rm -f /mnt/us/usbnet/auto 2>/dev/null || true

debug_snapshot

# Ignore framework signals during MTP setup
trap '' TERM HUP

log "Clearing gadget UDC binding"
echo "" > "$GDIR/UDC" 2>/dev/null || true

restart_mtp
stop_splash_daemon
bind_udc_if_needed

if ! mtp_looks_healthy; then
    log "MTP not healthy after first attempt; retrying"
    show_splash
    start_splash_daemon 15
    restart_mtp
    stop_splash_daemon
    bind_udc_if_needed
fi

stop_splash_daemon
if ! wait_for_udc_bound 4; then
    log "UDC not bound after normal bind; forcing one reenumeration"
    force_udc_reenumeration || true
    wait_for_udc_bound 4 || true
fi
wait_for_mtp_health 4 || true

# Signal daemon that setup is complete
touch "$ZENMTP_SETUP_DONE_FLAG" 2>/dev/null || true
log "wrote setup-done flag"

if ! mtp_looks_healthy; then
    debug_snapshot
fi

if mtp_looks_healthy; then
    log "ZenMTP success"
else
    log "ZenMTP failed health-check"
    if [ -n "$EIPS_BIN" ]; then
        "$EIPS_BIN" -c >/dev/null 2>/dev/null
        "$EIPS_BIN" -c >/dev/null 2>/dev/null
        eips 0 4 "MTP did not start." >/dev/null 2>&1
        eips 0 5 "See /tmp/zenmtp.log" >/dev/null 2>&1
    fi
fi
