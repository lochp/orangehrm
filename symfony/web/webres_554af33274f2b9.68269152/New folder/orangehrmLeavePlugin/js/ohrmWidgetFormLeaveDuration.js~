/* create orangehrm and orangehrm.widgets namespaces if not available) */
var orangehrm = orangehrm || {};
orangehrm.widgets = orangehrm.widgets || {};

orangehrm.widgets.formLeaveDuration = {
    handleDurationChange: function(value, fullDayId, halfDayId, specifyTimeId) {
        switch (value) {
            case 'full_day':
                $('#' + fullDayId).show();
                $('#' + halfDayId).hide();
                $('#' + specifyTimeId).hide();
                break;
            case 'half_day':
                alert($('#applyleave_partialDays').val());
                alert($('#applyleave_firstDuration_ampm').val());
                $('#' + fullDayId).hide();
                $('#' + halfDayId).show();
                $('#' + specifyTimeId).hide();
                break;
            case 'specify_time':
                $('#' + fullDayId).hide();
                $('#' + halfDayId).hide();
                $('#' + specifyTimeId).show();
                break;
        }
    }
};
