import sys
from operator import contains

import matplotlib.colors as mcolors
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import FormatStrFormatter
from mpl_toolkits.axes_grid1 import make_axes_locatable
from mpl_toolkits.mplot3d import Axes3D

COLORS = ["darkblue","blue","royalblue","cyan","limegreen","yellow","darkorange","red","darkred"]
SIMPLE_COLORS = ["darkblue", "royalblue", "limegreen", "darkorange", "red"]

def set_colormap(under_color="black", over_color="darkred"):
    """
        Create and configure the colors of a heatmap.

        Args:
            under_color (str): The name of the color to be set for undervalues. Defaults to black.
            over_color (str): The name of the color to be set for over values. Defaults to darkred.

        Returns:
            mcolors.LinearSegmentedColormap:
                The heatmap created.
    """

    hmap = mcolors.LinearSegmentedColormap.from_list("heatmap", COLORS)
    hmap.set_over(over_color) # values above MAX_VALUE
    hmap.set_under(under_color) # values below MIN_VALUE
    
    return hmap

def set_discrete_colormap(values):
    """
        Create a discrete colormap.

    Args:
        values (list): A list of the values in the dataset.

    Returns:
        mcolors.ListedColormap:
            The heatmap created.
        mcolors.BoundaryNorm:
            A mapping of the values to the colors in the heatmap.
    """

    hmap = mcolors.ListedColormap(SIMPLE_COLORS)
    norm = mcolors.BoundaryNorm(values, hmap.N)

    return hmap, norm


def set_labels(labels):
    """
        Set the x-axis, y-axis and title labels of the graphic.

        Args:
            labels (list): A list of labels to be included in the graphic. Should contain:
                           - labels[0]: The title of the graphic.
                           - labels[1]: The label for the x-axis.
                           - labels[2]: The label for the y-axis.
        Returns:
            None
    """

    title = " ".join(labels[0].split("_"))
    x_axis = " ".join(labels[1].split("_"))
    y_axis = " ".join(labels[2].split("_"))

    plt.title(title)
    plt.xlabel(x_axis)
    plt.ylabel(y_axis)


def set_tick_information(ax, axis_tick_info, axis: str):
    """
        Configure the axis (AX) locations and values for the given AXIS (x, y or z).

    Args:
        ax: matplolib Axes object
        axis_tick_info (tuple): A tuple containing two elements:
                                  - The location of the axis ticks.
                                  - The values of the axis ticks.
        axis (str): A string indicating the axis to be configured. Can be either x, y or z.

    Returns:
        None
    """

    tick_locations, tick_values = axis_tick_info

    if not axis_tick_info or len(tick_locations) == 0:
        return

    tick_locations = list(map(float, tick_locations))

    if axis == "x":
        if tick_values:
            ax.set_xticks(tick_locations, tick_values)
        else:
            ax.set_xticks(tick_locations)
    elif axis == "y":
        if tick_values:
            ax.set_yticks(tick_locations, tick_values)
        else:
            ax.set_yticks(tick_locations)
    elif axis == "z":
        if tick_values:
            ax.set_zticks(tick_locations, tick_values)
        else:
            ax.set_zticks(tick_locations)


def get_levels(min_max_values, data_type):
    """
        Determine the levels for the contour graphic.

        Args:
            min_max_values (tuple): A tuple containing two floats indicating the minimum and maximum values, respectively.
            data_type (str): Indicates whether the levels generated should be of type 'int' or 'float'.

        Returns:
            np.ndarray: An array containing the levels to be used in contour and contourf functions.
    """

    min_value, max_value = min_max_values

    levels = None
    if data_type == "int":
        levels = np.linspace(min_value,max_value, 9, endpoint=False, dtype=int)
    elif data_type == "float":
        levels = np.linspace(min_value, max_value, 9, endpoint=False, dtype=float)
    else:
        sys.stderr.write(f"Unknow data type on get_levels.\n")
        exit()

    return levels


def get_scaling_law():
    """
        Determines the x and y values of the scaling law from VARAS (2007).

        Returns:
            tuple: A tuple containing two lists:
                - The first list contains the x values.
                - The second list contains the y values of the scaling law from Eq(1) in the VARAS (2007) article.
    """

    exit_width = np.linspace(1, 14, 100)
    scaling_law = [2 / ew for ew in exit_width]
    exit_width = exit_width - 1 # the axis plot begins at point zero

    return  exit_width, scaling_law


def plot_heatmap(x_axis_ticks, y_axis_ticks, data_matrix, min_max_values, output_file, labels, over_value_color="darkred", origin="lower"):
    """
        Generate a heatmap based on the parameters' data.

        Args:
            x_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the x-axis ticks.
                                  - The values of the x-axis ticks.
            y_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the y-axis ticks.
                                  - The values of the y-axis ticks.
            data_matrix (np.ndarray): A 2D numpy array representing the data.
            min_max_values (tuple): indicates the minimum and maximum values, respectively.
            output_file (str): The name of the file where the generated image will be saved.
            labels (list): A list of labels to be included in the graphic. Should contain:
                       - labels[0]: The title of the graph.
                       - labels[1]: The label for the x-axis.
                       - labels[2]: The label for the y-axis.
            over_value_color (str): The color to be used for coloring over values. Defaults to darkred.
            origin (str): Indicates where the [0,0] coordinates should be placed (lower, upper). Defaults to "lower".
        Returns:
            None
    """

    bounds = [0,1,2,3,4,5]
    cmap, norm = set_discrete_colormap(bounds)
    tick_positions = [ (bounds[i] + bounds[i + 1]) / 2 for i in range(len(bounds) - 1)]

    fig, ax = plt.subplots()
    #fig = plt.figure()

    (min_value, max_value) = min_max_values
    #min_value = 24.3
    # plt.imshow(data_matrix, vmin=min_value, vmax=max_value, cmap=set_colormap(over_color=over_value_color), origin=origin)
    # im = ax.imshow(data_matrix, vmin=min_value, vmax=max_value, cmap=set_colormap(over_color=over_value_color), origin=origin)
    plt.imshow(data_matrix, cmap=cmap, norm=norm, origin=origin)

    set_tick_information(plt.gca(), x_axis_ticks, "x")
    set_tick_information(plt.gca(), y_axis_ticks, "y")

    colorbar = plt.colorbar()
    colorbar.ax.yaxis.set_major_formatter(FormatStrFormatter('%.5f'))

    colorbar.set_ticks(tick_positions)
    # colorbar.set_ticklabels(["0","1","2","3","4"])
    colorbar.set_ticklabels(["0.000000", "0.006308", "0.008410", "0.012616", "0.025231"])

    # divider = make_axes_locatable(ax)
    # cax = divider.append_axes("right", size="5%", pad=0.2)
    # cbar = plt.colorbar(im, cax=cax)
    # cbar = plt.colorbar()
    set_labels(labels)


    fig.savefig(f"out/{output_file}")


def plot_3d_heatmap(x_axis_ticks, y_axis_ticks, z_axis_ticks, data_matrix, min_max_values, output_file, labels, over_value_color="darkred"):
    """
            Generate a 3D heatmap based on the parameters' data.

            Args:
                x_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the x-axis ticks.
                                  - The values of the x-axis ticks.
                y_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the y-axis ticks.
                                  - The values of the y-axis ticks.
                z_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the z-axis ticks.
                                  - The values of the z-axis ticks.
                data_matrix (np.ndarray): A 2D numpy array representing the data.
                min_max_values (tuple): indicates the minimum and maximum values, respectively.
                output_file (str): The name of the file where the generated image will be saved.
                labels (list): A list of labels to be included in the graphic. Should contain:
                           - labels[0]: The title of the graph.
                           - labels[1]: The label for the x-axis.
                           - labels[2]: The label for the y-axis.
                over_value_color (str): The color to be used for coloring over values. Defaults to darkred.
            Returns:
                None
        """

    fig =  plt.figure()
    ax: Axes3D = fig.add_subplot(projection='3d')

    set_tick_information(ax, y_axis_ticks, "x")
    set_tick_information(ax, x_axis_ticks, "y") # The inversion was necessary to maintain compatibility with the 2D graphic
    set_tick_information(ax, z_axis_ticks, "z")

    nLines, nColumns = data_matrix.shape

    xRange = np.arange(0, nColumns)
    yRange = np.arange(0, nLines)

    yCoordinates, xCoordinates = np.meshgrid(yRange, xRange, indexing="ij")

    (min_value, max_value) = min_max_values
    surf = ax.plot_surface(yCoordinates, xCoordinates, data_matrix, vmax=max_value, cmap=set_colormap(over_color=over_value_color),
                           rcount=100, ccount=100, linewidth=0, antialiased=False)
    ax.set_zlim(0, max_value)
    ax.set_box_aspect([1,1,0.4])
    ax.view_init(elev=40)

    fig.colorbar(surf, ax=ax, aspect=12, shrink=0.7, pad=0.1)
    set_labels(labels)

    fig.savefig(f"out/{output_file}")


def plot_contours_graphic(data_matrix, min_max_values, output_file, labels, data_type):
    """
        Generate a contour graphic based on the parameters' data.

        Args:
            data_matrix (np.ndarray): A 2D numpy array representing the data.
            min_max_values (tuple): indicates the minimum and maximum values, respectively.
            output_file (str): The name of the file where the generated image will be saved.
            labels (list): A list of labels to be included in the graphic. Should contain:
                       - labels[0]: The title of the graph.
                       - labels[1]: The label for the x-axis.
                       - labels[2]: The label for the y-axis.
            data_type (str): indicates if the contour graphic is generated out of "int" or "float" data.

        Returns:
            None
    """

    fig = plt.figure()

    (min_value, max_value) = min_max_values
    levels = get_levels(min_max_values, data_type)

    plt.contour(data_matrix, vmin=min_value, vmax=max_value, levels=levels, colors="black", origin="lower", extend="both", linewidths=0.5)  # generate contour lines
    plt.contourf(data_matrix, vmin=min_value, vmax=max_value, levels=levels, cmap=set_colormap(), origin="lower", extend="both", antialiased=True)  # generate filled contour

    plt.colorbar()  # add the colorbar

    set_labels(labels)

    fig.savefig(f"out/{output_file}")


# def plot_line_graphic(x_axis_ticks, y_axis_ticks, legends, data_vector, output_file, labels, scaling_law, no_marker, no_legends, log_scale):
#     """
#         Generates a line graph with at least one line. Each line is plotted using each list of data_vector.
#
#         Args:
#             x_axis_ticks (tuple): A tuple containing two elements:
#                                   - The location of the x-axis ticks.
#                                   - The values of the x-axis ticks.
#             y_axis_ticks (tuple): A tuple containing two elements:
#                                   - The location of the y-axis ticks.
#                                   - The values of the y-axis ticks.
#             legends (list): The legends of each data set (list) in data_vector.
#             data_vector (list[list]): A list of lists containing the data to be plotted.
#                                       Each list represents one of the lines of the graphic.
#             output_file (str): The name of the file where the generated image will be saved.
#             labels (list): A list of labels to be included in the graphic. Should contain:
#                            - labels[0]: The title of the graphic.
#                            - labels[1]: The label for the x-axis.
#                            - labels[2]: The label for the y-axis.
#             scaling_law (bool): Indicates if the scaling law of (VARAS, 2007) should be plotted.
#             no_marker (bool): Indicates if the data points should be marked or not.
#             no_legends (bool): Indicates if the legends should be shown.
#             log_scale (bool): Indicates if the data should be plotted with log scale.
#         Returns:
#             None
#
#         Note:
#             If no axis information is provided, the locations and values of both the x-axis and y-axis are automatically determined.
#             If axis locations are specified but values are not, the values are automatically determined.
#             If x-axis values are provided without locations, these values are used directly as the x argument in the plot function.
#             If y-axis values are provided without locations, they are ignored.
#     """
#
#     marker = None if no_marker else 'o'
#
#     x_tick_locations, x_tick_values = x_axis_ticks
#     y_tick_locations, y_tick_values = y_axis_ticks
#
#     fig, ax = plt.subplots()
#
#     set_tick_information(ax, x_axis_ticks, "x")
#     set_tick_information(ax, y_axis_ticks, "y")
#
#     markers=["o", "s", "^", "D", "*"]
#     marker_index = 0
#
#     lineColors=["blue", "darkorange", "green", "yellow", "purple", "black"]
#     color_index = 0
#
#     if contains(legends[0], "0.3"):
#         color_index = 1
#         marker_index = 1
#     elif contains(legends[0], "0.5"):
#         color_index = 2
#         marker_index = 2
#     elif contains(legends[0], "0.7"):
#         color_index = 3
#         marker_index= 3
#     elif contains(legends[0], "0.9"):
#         color_index = 4
#         marker_index = 4
#
#     for data_line in data_vector:
#         current_marker = marker
#         if marker:
#             current_marker = markers[marker_index % len(markers)]
#             marker_index += 1
#
#         if len(data_line) == 1:
#             data_line = [data_line[0] for x in range(31)] # específico para os gráficos de obstáculos transponíveis.
#             plt.plot(data_line, "r-", linewidth=3, marker=False)
#             plt.text(x=27, y=data_line[0], s=f"{data_line[0]:.2f}", color="red", ha="left", va="bottom")
#         elif not x_tick_locations and x_tick_values:
#             if len(x_tick_values) != len(data_line):
#                 sys.stderr.write(f"The number of elements in the x-axis ({len(x_tick_values)}) is different from the number os elements in the y-axis ({len(data_line)}).\n")
#                 exit()
#
#             plt.plot(x_tick_values, data_line, '-', marker=current_marker, color=lineColors[color_index])
#         else:
#             plt.plot(data_line, "-", marker=current_marker, color=lineColors[color_index])
#
#         color_index += 1
#
#     plt.grid(True, which='both', ls='--', lw=0.5)
#
#     if scaling_law:
#         legends.append("T/N=2/a")
#         x, y = get_scaling_law()
#         plt.plot(x,y)
#
#     set_labels(labels)
#
#     if len(legends) > 1 and not no_legends:
#         newLegends = []
#         for legend in legends:
#             newLegend = " ".join(legend.split("_"))
#             newLegends.append(newLegend)
#
#         plt.legend(newLegends, loc='upper left', bbox_to_anchor=(1.05, 1), borderaxespad=0.)
#         plt.subplots_adjust(right=0.75)
#
#     # if log_scale:
#     #     plt.yscale('log')
#     #     # ax.yaxis.set_minor_locator(LogLocator(base=10.0, subs=np.arange(2, 10) * 0.1, numticks=10))
#     #     # ax.yaxis.set_minor_formatter(LogFormatter(labelOnlyBase=False))
#     #
#     #     formatter = LogFormatterSciNotation(base=10.0, labelOnlyBase=True)  # include minors
#     #     # ax.yaxis.set_major_formatter(formatter)
#     #     ax.yaxis.set_minor_formatter(formatter)
#     #
#     #     # formatter = ScalarFormatter(useOffset=True)
#     #     # formatter.set_useOffset(True)
#     #     # ax.yaxis.set_minor_formatter(formatter)
#
#     plt.tight_layout()
#
#     if contains(output_file, "alizadeh_restaurant_uniform_transponivel_lines_1"):
#         plt.ylim(63.8, 65.25)
#     elif contains(output_file, "daniel_anfiteatro_transponivel_lines_2"):
#         plt.ylim(142, 163)
#     elif contains(output_file, "silva_classroom_transponivel_lines.png"):
#         plt.ylim(99.9, 100.2)
#         # plt.ylim(99.5, 100.8)
#     elif contains(output_file, "silva_laboratory_transponivel_lines_2.png"):
#         plt.ylim(121.8, 124)
#
#     fig.savefig(f"out/{output_file}")

def plot_line_graphic(x_axis_ticks, y_axis_ticks, legends, data_vector, output_file, labels, scaling_law, no_marker):
    """
        Generates a line graph with at least one line. Each line is plotted using each list of data_vector.

        Args:
            x_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the x-axis ticks.
                                  - The values of the x-axis ticks.
            y_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the y-axis ticks.
                                  - The values of the y-axis ticks.
            legends (list): The legends of each data set (list) in data_vector.
            data_vector (list[list]): A list of lists containing the data to be plotted.
                                      Each list represents one of the lines of the graphic.
            output_file (str): The name of the file where the generated image will be saved.
            labels (list): A list of labels to be included in the graphic. Should contain:
                           - labels[0]: The title of the graphic.
                           - labels[1]: The label for the x-axis.
                           - labels[2]: The label for the y-axis.
            scaling_law (bool): Indicates if the scaling law of (VARAS, 2007) should be plotted.
            no_marker (bool): Indicates if the data points should be marked or not.
        Returns:
            None

        Note:
            If no axis information is provided, the locations and values of both the x-axis and y-axis are automatically determined.
            If axis locations are specified but values are not, the values are automatically determined.
            If x-axis values are provided without locations, these values are used directly as the x argument in the plot function.
            If y-axis values are provided without locations, they are ignored.
    """

    marker = None if no_marker else 'o'

    x_tick_locations, x_tick_values = x_axis_ticks
    y_tick_locations, y_tick_values = y_axis_ticks

    fig, ax = plt.subplots()

    set_tick_information(ax, x_axis_ticks, "x")
    set_tick_information(ax, y_axis_ticks, "y")

    for data_line in data_vector:
        if not x_tick_locations and x_tick_values:
            if len(x_tick_values) != len(data_line):
                sys.stderr.write(f"The number of elements in the x-axis ({len(x_tick_values)}) is different from the number os elements in the y-axis ({len(data_line)}).\n")
                exit()

            plt.plot(x_tick_values, data_line, '-', marker=marker)
        else:
            plt.plot(data_line, "-", marker=marker)

    if scaling_law:
        legends.append("T/N=2/a")
        x, y = get_scaling_law()
        plt.plot(x,y)

    set_labels(labels)

    if len(legends) > 1:
        newLegends = []
        for legend in legends:
            newLegend = " ".join(legend.split("_"))
            newLegends.append(newLegend)

            plt.legend(newLegends, fontsize="12")

    fig.savefig(f"out/{output_file}")



def plot_scatter_graphic(x_axis_ticks, y_axis_ticks, legends, data_vector, output_file, labels):
    """
        Generates a point graphic. Multiple data sets can be plotted into the same graphic.

        Args:
            x_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the x-axis ticks.
                                  - The values of the x-axis ticks.
            y_axis_ticks (tuple): A tuple containing two elements:
                                  - The location of the y-axis ticks.
                                  - The values of the y-axis ticks.
            legends (list): The legends of each data set (list) in data_vector.
            data_vector (list[list]): A list of lists containing the data to be plotted.
                                      Each list represents one of the lines of the graphic.
            output_file (str): The name of the file where the generated image will be saved.
            labels (list): A list of labels to be included in the graphic. Should contain:
                           - labels[0]: The title of the graphic.
                           - labels[1]: The label for the x-axis.
                           - labels[2]: The label for the y-axis.
        Returns:
            None

        Note:
            If axis locations are provided without corresponding values, the values will be automatically determined.
            The x-axis locations are required.
            If y-axis values are provided without locations, they are ignored.
    """

    x_tick_locations, x_tick_values = x_axis_ticks
    y_tick_locations, y_tick_values = y_axis_ticks

    fig, ax = plt.subplots()

    if not x_tick_locations:
        sys.stderr.write(f"x-axis tick locations are required.\n")
        exit()

    set_tick_information(ax, x_axis_ticks, "x")
    set_tick_information(ax, y_axis_ticks, "y")

    plt.scatter(x_tick_locations, data_vector[0])

    set_labels(labels)

    if len(legends) > 1:
        plt.legend(legends)

    fig.savefig(f"out/{output_file}")

def plot_column_graphic(categories, values, y_ticks, output_file, labels):

    if len(categories) != len(values):
        sys.stderr.write(f"The number of values must be equal to the number of categories.\n")

    fig, ax = plt.subplots()

    for level in y_ticks:
        plt.axhline(y=level, color="gray", linestyle="-", linewidth=1, zorder=0)

    bars = plt.bar(categories, values, width=0.5, color=["royalblue", "orange", "royalblue", "orange"])
    ax.bar_label(bars,fmt="{:.2f}", padding=1)

    set_labels(labels)

    fig.savefig(f"out/{output_file}")