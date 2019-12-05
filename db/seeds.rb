# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mission.delete_all
Category.delete_all

sg = Category.create!(mission_type: 'Spiritual Growth')
ev = Category.create!(mission_type: 'Evangelism') 
ser = Category.create!(mission_type: 'Service/Gratitude')
equ = Category.create!(mission_type: 'Equipping')
thanksgiving = Category.create!(mission_type: 'Thanksgiving Challenge')

# service/gratitude
Mission.create!(name: 'Do the dishes for your family (max: 10)', points: 5, category: ser)
Mission.create!(name: 'Fix something around the house', points: 5, category: ser)
Mission.create!(name: 'Initiate a family gathering or activity', points: 20, category: ser)
Mission.create!(name: 'Serve at a local church event', points: 50, category: ser)
Mission.create!(name: 'Take care of an errand for your family (max: 10)', points: 5, category: ser)
Mission.create!(name: 'Write a "Thank you" note to someone who is not your peer', points: 20, category: ser)
Mission.create!(name: 'Cook a meal for your family (post a picture!)', points: 15, category: ser)
Mission.create!(name: 'Do the laundry for your family (max: 10)', points: 5, category: ser)
Mission.create!(name: 'Learn a new dish (post a picture!)', points: 10, category: ser)
Mission.create!(name: 'Vacuum the house (max: 10)', points: 5, category: ser)
Mission.create!(name: 'Keep a gratitude log every day and write 10 things you are grateful for (for the whole break)', points: 100, category: ser)

# evangelism
Mission.create!(name: 'Bring a non-Christian friend or family member to church', points: 50, category: ev)
Mission.create!(name: 'Give a special talk or presentation on a Christian topic (can do this with your friends)', points: 100, category: ev)
Mission.create!(name: 'Meet up with a friend and find out about their spiritual background or views on Christianity', points: 40, category: ev)
Mission.create!(name: 'Share your testimony with a friend or family member', points: 40, category: ev)
Mission.create!(name: 'Visit a convalescent home and share John 3:16 with a resident (ask for permission first!)', points: 50, category: ev)
Mission.create!(name: 'Share the gospel with a non-Christian friend or family member', points: 50, category: ev)
Mission.create!(name: 'Read a Christian book with a non Christian friend or family member', points: 50, category: ev)
Mission.create!(name: 'Lead C101 with a non-Christian friend or family member', points: 200, category: ev)
Mission.create!(name: 'Lead a bible study with a non-Christian friend or family member', points: 150, category: ev)

# spiritual growth
Mission.create!(name: 'Do DT and post one point that spoke to you (can submit once per day)', points: 10, category: sg)
Mission.create!(name: 'Meet up with a friend and do DT together (one submission per group, can also meet online for 30 min and share)', points: 30, category: sg)
Mission.create!(name: 'Read through the Psalms (post your favorite Psalms and why)', points: 75, category: sg)
Mission.create!(name: 'Memorize: Psalm 103 (video submission required)', points: 50, category: sg)
Mission.create!(name: 'Memorize: Psalm 51 (video submission required)', points: 50, category: sg)
Mission.create!(name: 'Memorize: Psalm 23 (video submission required)', points: 50, category: sg)
Mission.create!(name: 'Memorize: Psalm 1 (video submission required)', points: 50, category: sg)
Mission.create!(name: 'Go on a prayer walk for at least 15 minutes', points: 15, category: sg)
Mission.create!(name: 'Memorize: 2 Timothy (video submission required)', points: 830, category: sg)
Mission.create!(name: 'Memorize: Any hymn (video submission required)', points: 20, category: sg)
Mission.create!(name: 'Memorize: Beatitudes (video submission required)', points: 50, category: sg)
Mission.create!(name: 'Read through the entire New Testament (post your favorite NT book and why)', points: 200, category: sg)
Mission.create!(name: 'Read through the entire Old Testament (post your favorite OT book and why)', points: 1000, category: sg)
Mission.create!(name: 'Read through the Gospels and post one personal takeaway', points: 50, category: sg)
Mission.create!(name: 'Outline: One of the Gospels', points: 50, category: sg)
Mission.create!(name: 'Outline: One of the Epistles', points: 30, category: sg)
Mission.create!(name: 'Pray for your non-Christian family/friends for 30 minutes', points: 30, category: sg)

# equipping
Mission.create!(name: 'Read "Calvary Road" (Roy Hession) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Making All Things New" (Henri Nouwen) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Humility" (Andrew Murray) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "We Would See Jesus" (Roy Hession) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "A Shepherd Looks at Psalm 23" (W. Phillip Keller) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Living Sacrifice" (Helen Roseveare) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Living Faith" (Helen Roseveare) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Living Holiness" (Helen Roseveare) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Living Fellowship" (Helen Roseveare) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Do Hard Things" (Alex Harris) and post one personal takeaway', points: 30, category: equ)
Mission.create!(name: 'Read "Stop Asking Jesus into Your Heart" (JD Greear)', points: 30, category: equ)
Mission.create!(name: 'Read "Letters from a Skeptic" (Greg Boyd) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "The Four Loves" (CS Lewis) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "The Great Divorce" (CS Lewis) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Loving God" (Chuck Colson) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "The Good Life" (Chuck Colson) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Basic Christianity" (John Stott) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Too Busy Not To Pray" (Bill Hybels) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "The Return of the Prodigal Son" (Henri Nouwen) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Case for Grace" (Lee Strobel) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Case for Faith" (Lee Strobel) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Case for Christ" (Lee Strobel) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Mere Christianity" (CS Lewis) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read "Miracles" (CS Lewis) and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read a biography of a Christian hero and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Read any Christian book and post one personal takeaway', points: 50, category: equ)
Mission.create!(name: 'Come up with a song, dance, choreo, etc. to help learn the Bible (or do your own version of church-appropriate dance moves)', points: 30, category: equ)
Mission.create!(name: 'Exercise for at least 30 minutes (max: 10 of these entries per person)', points: 5, category: equ)
Mission.create!(name: 'Learn how to play a praise song and post a video (e.g. guitar, keyboard, etc.)', points: 20, category: equ)
Mission.create!(name: 'Prepare a winsome and clear explanation of the Gospel in less than 2 minutes (post a video!)', points: 30, category: equ)
Mission.create!(name: "Run a 10K (pics or it didn't happen)", points: 50, category: equ)
Mission.create!(name: 'Reach out and connect with staff over facetime/google hangouts/skype/call (not text!)', points: 10, category: equ)

#Thanksgiving Challenge
Mission.create!(name: 'Completed Thanksgiving Challenge', points: 200, category: thanksgiving)
