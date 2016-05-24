def slices(string, series_length):
    if series_length > len(string) or series_length == 0:
        raise ValueError('Invalid slice length for this series')
    series = []
    series_size = len(string) - (series_length - 1)
    while len(series) < series_size:
        if series_length == 1:
            single_series = string[0]
        else:
            single_series = string[0:series_length]
        series.append(single_series)
        string = string[1:]
    series = [list(elem) for elem in series]
    series = [[int(elem) for elem in single_series] for single_series in series]
    return series
