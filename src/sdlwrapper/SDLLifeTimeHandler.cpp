#include "SDLLifeTimeHandler.hpp"

sdlwrapper::SDLLifeTimeHandler::SDLLifeTimeHandler()
{
    // Initialize SDL
    if( SDL_Init( SDL_INIT_VIDEO ) < 0 )
    {
        // TODO: remove
        printf( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
        // TODO: actual exception
        throw 1;
    }
}

sdlwrapper::SDLLifeTimeHandler::~SDLLifeTimeHandler()
{
    // Quit SDL subsystems
    SDL_Quit();
}

