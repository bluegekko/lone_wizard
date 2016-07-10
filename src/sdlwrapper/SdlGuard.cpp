#include "SdlGuard.hpp"

sdlwrapper::SdlGuard::SdlGuard()
{
    // Initialize SDL
    if( SDL_Init( SDL_INIT_VIDEO ) < 0 )
    {
        // TODO: remove
        //printf( "SDL could not initialize! SDL_Error: %s\n", SDL_GetError() );
        // TODO: actual exception
        throw 1;
    }
}

sdlwrapper::SdlGuard::~SdlGuard()
{
    // Quit SDL subsystems
    SDL_Quit();
}

