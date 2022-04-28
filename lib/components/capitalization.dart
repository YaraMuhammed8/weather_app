String capitalization(String value)
{
  if(value.length>1) {
    return value[0].toUpperCase() + value.substring(1);
  } else {
    return value[0].toUpperCase();
  }
}