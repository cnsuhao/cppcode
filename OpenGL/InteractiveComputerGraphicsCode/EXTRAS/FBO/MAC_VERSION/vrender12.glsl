attribute vec4 vPosition;
attribute vec2 vTexCoord;

varying vec2 texCoord;

void main()
{

gl_Position = vPosition;
texCoord = vTexCoord;

}
