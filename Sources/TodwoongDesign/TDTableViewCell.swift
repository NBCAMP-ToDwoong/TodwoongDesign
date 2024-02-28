
import UIKit

public class TDTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static public var identifier = "TDTableViewCellIdentifier"
    public var onCheckButtonTapped: (() -> Void)?
    
    // MARK: - UI Properties
    
    public lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = TDStyle.color.mainTheme
        button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.body(style: .regular)
        label.textColor = TDStyle.color.primaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var groupLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.textGreen
        label.numberOfLines = 0
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var titleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, groupLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .firstBaseline
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.secondaryLabel
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.secondaryLabel
        
        return label
    }()
    
    private lazy var timeAlarmIcon = UIImageView.createIconImageView(systemName: "bell", tintColor: TDStyle.color.textGreen, width: 14, height: 14)
    
    private lazy var dateTimeStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, timeLabel, timeAlarmIcon])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    private lazy var locationIcon = UIImageView.createIconImageView(systemName: "mappin.circle.fill", tintColor: .systemRed, width: 14, height: 14)
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.primaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var locationAlarmIcon = UIImageView.createIconImageView(systemName: "bell", tintColor: TDStyle.color.textGreen, width: 14, height: 14)
    
    private lazy var locationInfoStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationIcon, locationLabel])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.backgroundColor = TDStyle.color.lightGray
        stackView.layer.cornerRadius = 5
        stackView.layoutMargins = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        
        return stackView
    }()
    
    private lazy var locationStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationInfoStack, locationAlarmIcon])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension TDTableViewCell {
    @objc private func checkButtonTapped() {
        onCheckButtonTapped?()
    }
    
    private func setLayout() {
        contentView.addSubview(checkButton)
        contentView.addSubview(titleStack)
        contentView.addSubview(dateTimeStack)
        contentView.addSubview(locationStack)
        
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            checkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
            titleStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            dateTimeStack.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 10),
            dateTimeStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])

        locationIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        locationInfoStack.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width * 0.7).isActive = true
        
        NSLayoutConstraint.activate([
            locationStack.topAnchor.constraint(equalTo: dateTimeStack.bottomAnchor, constant: 6),
            locationStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            locationStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])
    }
}

// MARK: - Configure Method

extension TDTableViewCell {
    public func configure(data: TodoModel) {
        titleLabel.text = data.title
        
        if let category = data.category {
            groupLabel.text = "#\(category)"
        } else {
            groupLabel.text = ""
        }
        
        if let dueDate = data.dueDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            dateLabel.text = formatter.string(from: dueDate)
        } else {
            dateLabel.isHidden = true
        }
        
        if let dueTime = data.dueTime {
            let formatter = DateFormatter()
            formatter.dateFormat = "a hh:mm"
            formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
            timeLabel.text = formatter.string(from: dueTime)
        } else {
            timeLabel.isHidden = true
        }
        
        // 위치 정보 설정
        if let location = data.place {
            locationLabel.text = "\(location)"
        } else {
            locationInfoStack.isHidden = true
            locationStack.isHidden = true
        }
        
        if data.timeAlarm == false {
            timeAlarmIcon.isHidden = true
        } else {
            timeAlarmIcon.isHidden = false
        }
        
        if data.placeAlarm == false {
            locationAlarmIcon.isHidden = true
        } else {
            locationAlarmIcon.isHidden = false
        }
    }
    
}
