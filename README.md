# MonkeyRadioReborn
Code for monkeyradioreborn.com

This is a not very organized repo for https://monkeyradioreborn.com/

By deploying deploying the images here to a kubernetes server, you can pretty quickly have a running clone of this site.  Of course, this is not limited to just "monkey radio" music, you can add your own playlist

## Deployment Overview
### Containers
- web - web frontend. written in Vue
- now-playing - rust api that reads from our icecast server to get the current tracks
- icecast - this serves up our music stream
- mpd - this plays music and streams it to icecast for broadcast
### Services
- web-80-tcp the port you want the website running on - 32760 by default
- icecast-8092-tcp the port you want the icecast (music stream) running on - 32762 by default
- nowplaying-api the port you want the nowplaying-api running on - 32761 by default
### Volumes
- monkey-radio-pv - this is an nfs mount for your music source.  it can be any pvc.  it gets mounted to /music and the whole thing gets turned into a playlist
                                                                                          
                                                                                               
                                ┌──────────────────────────────────────────────────────────┐   
                                │    __  ___          __              ___          ___     │   
                                │   /  |/  /__  ___  / /_____ __ __  / _ \___ ____/ (_)__  │   
                                │  / /|_/ / _ \/ _ \/  '_/ -_) // / / , _/ _ `/ _  / / _ \ │   
                                │ /_/  /_/\___/_//_/_/\_\\__/\_, / /_/|_|\_,_/\_,_/_/\___/ │   
                                │                           /___/                          │   
                                └──────────────────────────────────────────────────────────┘   
                                                                                               
                                                                                               
                                                                                               
                                                        ┌──────────────────┐                   
                                                        │                  │                   
                                             ┌─────────▶│       web        │◀────────┐         
                                             │          │                  │         │         
                                             │          └──────────────────┘         │         
                                             │                                       │         
                                             │                                       │         
                                             │                                       │         
                                             │                                       │         
                                             │                                       │         
                                 ┌───────────────────────┐                           │         
                                 │                       │                  ┌─────────────────┐
                                 │    now-playing-api    │                  │                 │
                                 │                       │                  │     icecast     │
                                 └───────────────────────┘                  │                 │
                                             ▲                              └─────────────────┘
                                                                                     ▲         
                                             │                                       │         
                                                                                     │         
                                             │           ┌────────────────┐          │         
                                                         │                │          │         
                                             └ ─ ─ ─ ─ ─▶│      mpd       │──────────┘         
                                                         │                │                    
                                                         └────────────────┘                    
