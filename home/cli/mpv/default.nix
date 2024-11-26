{ pkgs, config, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      gpu-api = "opengl";
      audio-stream-silence = true;
      audio-samplerate = 44100;
    };
  };
}
