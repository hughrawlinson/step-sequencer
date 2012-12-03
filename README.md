# Step Sequencer

This is a basic step sequencer I made for Intro To Programming class at University. We were told to use loops and arrays, but I went all out and made a whole object-oriented system. I'm quite proud of it, it's a lot of code, and it's pretty complex. I realise the click mechanism toggles buttons even when you click in the margins, but either way I'm pretty happy with the way mouseX and mouseY data flows through the program and toggles the right button. I'm not happy with the way I've implemented audio, I tried for hours to put it into a class of it's own, but apparently the minim library didn't like that, so I kept getting NullPointerExceptions with no cause that I could find. I meant to standardise the classes, maybe even have a master class that they all inherit functions like drawObject and setDrawVars (or better yet, set those variables in a constructor like I've done on some of the classes), but seeing as the deadline is in about an hour and I've stayed up all night working on it, I think I'll give it a miss this time.

## Credit where it's due

I used the minim library, so thanks to Damien Di Fede. I also used some drum samples that weren't from freesound.org, I found them on my hard drive and if they were there they must have been free, but if they're yours and you don't want me using them here get in touch and I'll happily replace them. Also, the softGlow function that doesn't work in the stepGraphics class was broken in an attempt to use a classmates code to make a soft circular glow.

## Useful stuff

I've put loads of the different pars of the software into different classes, most useful of which is the button class, which makes a square toggle. Visually it's quite like the one in Max/MSP, which is nice. Then the track class is essentially an array of button objects, and a matrix class is an array of class objects.

## Final Words

I do intend to work more on this, it was quite a bit of fun. If you think of some other feature please don't hesitate to either tell me to do it, or fork this project and do it yourself, then submit a pull request. Thanks for checking it out!
